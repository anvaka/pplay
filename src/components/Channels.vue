<template>
  <div class='channel-container secondary-border'>
    <div class='title'>Channels</div>

    <div v-if='showAddChannel'>
      <div class='channel-picker'>
        <div class='help-text secondary-color'>Paste image below or <label class='browse-btn primary-text' for="local-files-button">pick a file from your device</label></div>
        <form class='input-row' @submit.prevent='onSubmit' :class='{"focused": inputSelected}'>
          <input class='image-picker' type="text" placeholder="Paste image here" 
            v-model='newInput'
            autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"
            @focus='onInputFocused' @blur='inputSelected = false'>
          <div class='row'>
            <a href='#' @click.prevent='cancelAdd'>Cancel</a>
            <a href='#' @click.prevent='onSubmit'>Add</a>
          </div>
        </form>
        <input type='file' id='local-files-button' class='nodisplay' name="file" multiple="" accept="image/*" @change='onFilePickerChanged'>
      </div>
    </div>

    <component v-for='channel in vm.list' :is='getChannelType(channel)' :vm='channel' @remove='remove(channel)'></component>

    <a href="#" @click.prevent='addChannel' >Add channel</a>
  </div>
</template>
<script>
import ImageChannel from './Channels/Image';

export default {
  name: 'Channels',
  props: ['vm'],
  data() {
    return {
      newInput: '',
      inputSelected: false,
      showAddChannel: false,
      loadingInput: false,
    };
  },
  computed: {
    addChannelVisible() {
      return !this.showAddChannel && this.vm && this.vm.list.length < 3;
    }
  },
  methods: {
    getChannelType(channelViewModel) {
      if (channelViewModel.kind === 'image') {
        return ImageChannel;
      }
      throw new Error('Not implemented');
    },
    remove(channel) {
      this.vm.removeChannel(channel);
    },
    onFilePickerChanged() {

    },
    onInputFocused(e) {
      e.target.select();
      this.inputSelected = true;
    },
    onFilePickerChanged(e) {
      var files = e.target.files;
      loadInput(files[0]);
      // Try to reset the type
      e.target.type = 'input';
      e.target.type = 'file';
    },
    onSubmit() {
      this.loadInput(this.newInput);
    },
    loadInput(inputValue) {
      this.vm.addChannel(inputValue);
      this.showAddChannel = false;
      this.newInput = '';
    },
    addChannel() {
      this.showAddChannel = true;
    },
    cancelAdd() {
      this.showAddChannel = false;
    },
    confirmAdd() {
      this.showAddChannel = false;
    },
  }
}
</script>

<style lang="stylus">
@import "../styles/app.styl"

.channel-container {
  border-top: 1px solid ;
  margin: 0 -8px;
  padding: 8px;
}
.row {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
.help-text {
  font-size: 12px;
  font-style: italic;
  margin: 8px 0;
}
.channel-header {
  border-top: 1px solid;
  border-bottom: 1px solid;
  margin: 0 -8px;
  padding: 8px;
  a {
    width: 100%;
    text-align: center;
    display: inline-block;
  }
}
.channel-picker {
  border-top: 1px solid;
  border-bottom: 1px solid;
  margin: 0 -8px;
  padding: 8px;
}
</style>
