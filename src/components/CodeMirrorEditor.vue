<template>
  <div>
    <codemirror v-model='value.code' ref='editor' :options="{
      viewportMargin: Infinity,
      theme: 'glsl',
      mode: 'glsl',
    }"></codemirror>

  </div>
</template>
<script>
import bus from '../bus';
import { codemirror } from 'vue-codemirror-lite';

var CodeMirror = require('codemirror/lib/codemirror.js')
require('codemirror/addon/comment/comment.js');
function toggleGLSLComment(cm) {
  cm.toggleComment({
    indent: true,
    lineComment: '//'
  });
}

require('./glslmode')(CodeMirror);
export default {
  name: 'CodeMirrorEditor',
  props: ['value'],
  components: {
    codemirror
  },

  created() {
    this.$emit('loaded')
  },
  mounted() {
    bus.on('settings-collapsed', refreshEditor, this);

    this.$refs.editor.editor.setOption('extraKeys', {
      'Cmd-/': toggleGLSLComment,
      'Ctrl-/': toggleGLSLComment
    });
  },

  beforeDestroy() {
    bus.off('settings-collapsed', refreshEditor, this);
  },
}


function refreshEditor(isCollapsed) {
  // Code mirror sometimes is not visible https://stackoverflow.com/questions/8349571/codemirror-editor-is-not-loading-content-until-clicked
  if (!isCollapsed) {
    setTimeout(() => {
      this.$refs.editor.editor.refresh()
    }, 10);
  }
}
</script>

<style lang="stylus">
.glsl-editor {
  @import "../styles/glsl-theme.styl"
  
  padding-bottom: 8px;
}
</style>