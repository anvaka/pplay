<template>
  <div class="monaco-editor"></div>
</template>
<script>
import {createEditor} from '../monaco-services/createEditor';
import {debounce} from '../util/utils';

export default {
  name: 'MonacoEditor',
  props: ['value'],
  data() {
    return {
      hasErrors: false
    }
  },
  created() {
    this.$emit('loaded')
  },
  mounted() {
    this.editorHandle = createEditor(this.$el, this.value.code);
    this.editorHandle.on('content-changed', this.editorContentChanged, this);
  },
  methods: {
    editorContentChanged(editor, hasErrors) {
      let self = this;
      this.hasErrors = hasErrors;
      debounce(() => {
        if (!self.hasErrors) {
          this.value.code = editor.getValue();
          self.$emit('input', this.value);
        }
      }, 20);
    }
  },
  watch: {
    'value.code': function(newVal) {
      var editorValue = this.editorHandle.getValue()
      if (newVal !== editorValue) {
        this.skipNextChangeEvent = true
        this.editorHandle.setValue(newVal)
      }
    }
  },
  beforeDestroy() {
    if (this.editorHandle) {
      this.editorHandle.dispose();
      this.editorHandle = null;
    }
  }
};
</script>

<style lang="stylus">
.monaco-editor {
  width: 100%;
  height: 300px;
}
</style>