module.exports = {
  publicPath: '',
  chainWebpack: config => {
    // GLSL Loader
    config.module
      .rule('glsl')
      .test(/\.(glsl|frag|vert)$/)
      .use('raw-loader')
        .loader('raw-loader')
        .end()
  }
}