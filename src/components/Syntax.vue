<template>
  <div class='help'>
    <p>Color of a pixel is defined with GLSL language. This is a high level programming language for the graphic card.</p>
    <p>A few important things you need to know:
      <ul>
        <li>GLSL is strictly typed. Each real number <b>must have</b> a dot. E.g. "42" should be written as "42."</li>
        <li>List of built-in functions is <a href='http://www.shaderific.com/glsl-functions' target='_blank'>available here</a> </li>
        <li>Extended functions list is <a href='https://github.com/anvaka/pplay/blob/master/README.md' target='_blank'>available in the readme</a> </li>
      </ul>
      Once you played with standard functions, understanding <a href='http://www.shaderific.com/glsl-types' target='_blank'>glsl's types</a> can be useful.
    </p>
    <p>Note: this help is very basic. If you know how to extend it - please <a href='https://github.com/anvaka/pplay/' target='_blank'>contribute to the project</a>.</p>
    <a href="#" @click.prevent='close' class='close'>Close help</a>
  </div>
</template>

<script>
export default {
  name: 'Syntax',
  methods: {
    close() {
      this.$emit('close');
    }
  }
}
</script>