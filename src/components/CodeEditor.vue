<template>
<div class='glsl-editor'>
  <editor v-model='model' @loaded='onEditorLoaded'></editor>
  <textarea v-model="model.code" v-if="isLoading" class='quick-edit' spellcheck='false'></textarea>

  <div class='error-container'>
    <pre v-if='model.error' class='error hl'>{{model.error}}</pre>
    <pre v-if='model.errorDetail' class='error detail'>{{model.errorDetail}}</pre>
  </div> 
</div>
</template>

<script>
import appState from '../appState';
let defaultEditor = isMobile ? 'CodeMirror' : 'CodeMirror';
let useMonaco =  defaultEditor === 'Monaco' || appState.qs.get('monaco');

export default {
  name: 'CodeEditor',
  props: ['model'],
  data() {
    return {
      isLoading: true
    };
  },
  components: {
    editor: getMostAppropriateEditor
  },
  methods: {
    onEditorLoaded() {
      this.isLoading = false;
    }
  },
  watch: {
    'model.code': function() {
      if (this.pendingSetCode) {
        clearTimeout(this.pendingSetCode);
      }

      // We don't want to update code on each key stroke. This would have negative
      // impact on performance.
      this.pendingSetCode = setTimeout(() => {
        this.model.setCode(this.model.code);
        this.pendingSetCode = 0;
      }, 300);
    },
  }
}

function getMostAppropriateEditor() {
  return new Promise((resolve) => {
    if (useMonaco) {
      require.ensure('./MonacoEditor.vue', () => {
        resolve(require('./MonacoEditor.vue'));
      });
    } else {
      require.ensure('./CodeMirrorEditor.vue', () => {
        resolve(require('./CodeMirrorEditor.vue'));
      });
    }
  });
}

function isMobile() {
  return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}
</script>

<style lang="stylus">
.quick-edit {
  width: 100%;
  height: 300px;
  background: #061838;
  color: white;
  font-size: 14px;
}
</style>