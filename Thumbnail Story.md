# og:image story

[My website](https://anvaka.github.io/pplay) is hosted on GitHub pages. It is free and fast way to host 
a website, but it introduced a problem that I'm going to discuss below.

## The problem

When someone shares a link to a website on reddit, reddit reads `og:image` meta tag:

``` html
<meta property="og:image" content="https://github.com/anvaka/pplay/wiki/images/pplay_icon.png" />
```

and renders it as a thumbnail:

![reddit icons](https://github.com/anvaka/pplay/wiki/images/reddit-default.png)

My website uses a query string to render dynamic WebGL scenes. Instead of one default image
for all links, I wanted to render a thumbnail icon that matches the scene:

![reddit icons](https://github.com/anvaka/pplay/wiki/images/reddit-icons.png)

How can we go from the default image to the scene image? If you own the html rendering
backend, it is not a problem at all. You just render corresponding `og:image` for the
incoming request:

``` html
<meta property="og:image" content="https://{... path to rendered image }" />
```

This isn't an option for github pages, however, because they are serving static content only.

My website restores the entire scene from a query string using javascript. And reddit does not
execute javascript when it crawls image thumbnails. That is the problem.

## A Solution 

I first tried to experiment, and set `og:image` via plain javascript:

``` html
<!-- Somewhere in the head -->
<script type='text/javascript'>
  document.head.innerHTML += '<meta property="og:image" content="https://via.placeholder.com/350x250" />'
</script>
```

That [didn't work](https://www.reddit.com/r/andytuba/comments/7udj9z/does_dynamic_ogimage_work/):

![reddit no js](https://github.com/anvaka/pplay/wiki/images/reddit-nojs.png)

The image did not load. But that made me wonder. How does reddit actually crawl these images?
Reddit used to be an open source project, so I just searched for `og:image`, and found the [relevant bit](https://github.com/reddit-archive/reddit/blob/da549027955c28b2e99098a22c814fc2ba729e11/r2/r2/lib/media.py#L682):

``` python
_, image_data = _fetch_url(thumbnail_url, referer=self.url)
```

I couldn't believe my eyes - the reddit actually sends the referer of the page which it tries to crawl 😍.

This is amazing news. You see, my application state is stored in the query string. If someone sends me the entire
string - I can reconstruct the original image and give it back to the requestor. 

So I did a quick test, [and confirmed](https://www.reddit.com/r/pplay/), that reddit does send the referer indeed. 
Now we need to handle the request somewhere and return custom images.

## Handling request

I choose [AWS Lambda](https://aws.amazon.com/lambda/) to handle image requests. It is trivial to setup and start using.

### Taking screenshots

To take a screenshot of a website we can use Headless Chrome with something like [puppeteer](https://github.com/GoogleChrome/puppeteer). It is a bit challenging to deploy it on AWS lambda, but [there are libraries](https://github.com/GoogleChrome/puppeteer/blob/1716a748aaa936449d7441cbfcf06149384788c2/docs/troubleshooting.md#running-puppeteer-on-aws-lambda).

This would be the end of my story, however my website uses WebGL to render scene.
I haven't seen WebGL support in headless Chrome  yet, so I decided to dig a bit deeper.

It turns out someone had [successfully got WebGL running](https://bugs.chromium.org/p/chromium/issues/detail?id=617551#c30) in
headless mode.

I followed the steps, from the link above. Rented a quick EC2 instance that matches [AWS lambda image](https://docs.aws.amazon.com/lambda/latest/dg/current-supported-versions.html), pulled the `osmesa` source code there, compiled it.

It failed a few times with missing dependencies, but googling around always yielded a solution. At the end of the day, I got
a binary file called `libMangledOSMesa32.so`. This file is the rendering engine, which works in headless mode. Just rename it to
`libosmesa.so` and place it next to the `headless-shell` compiled executable (can be found [here](https://github.com/universalbasket/aws-lambda-chrome/tree/master/builds/chrome) or [here](https://github.com/adieuadieu/serverless-chrome/releases) ).

These two, when deployed to lambda gave me lots of joy and happiness - the WebGL scene was rendered correctly.

If you are eager to try yourself - I have compiled the `libosmesa` library that I'm using [here](https://github.com/anvaka/pplay/wiki/libosmesa/libosmesa.so)
(NOTE: if you are using it, you must agree to https://www.mesa3d.org/license.html - it is an MIT license). It would also be 
nice to have this [enabled by default](https://github.com/adieuadieu/serverless-chrome/issues/108) in `serverless-chrome` package.

## Not for all

Unfortunately `og:image` referer trick works only for reddit crawler. Huge cudos to the developers who thought about this
use case.

Facebook crawler does not do it, so the lambda function will 302 it to default image. If you happen to know someone at
Facebook who can help and add the referer to their crawler - I'd be very happy :).

# Summary

Two bits:

1. reddit sends referer to `og:image` url, which can be leveraged to render dynamic thumbnails for statically hosted websites
2. It is possible to render a WebGL scene in AWS lambda.

I hope you enjoyed it :).