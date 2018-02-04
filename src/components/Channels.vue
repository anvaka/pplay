<template>
  <div class='channel-container'>
    <div class='title'>Channels <a href="#" @click.prevent='toggleAddChannel' class='help-title' :class='{"syntax-visible": showAddChannel}'>add channel</a>
    </div>
    <div v-if='showAddChannel'>
      <div class='channel-picker help'>
        <p>Channels allow your shader to access images (textures).</p>
        <div class='help-text secondary-color'>Paste link to imgur image or soundcloud song below
          <!-- below or <label class='browse-btn primary-text' for="local-files-button">pick a file from your device</label> -->
          </div>
        <form class='input-row' @submit.prevent='onSubmit' :class='{"focused": inputSelected}'>
          <input class='image-picker' type="text" placeholder="Paste link here" 
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
    <div v-if='vm.list.length === 0 && !showAddChannel' class='no-channels'>
      <p>Channels allow your shader to access images (textures). Click
        <a href='#' @click.prevent='toggleAddChannel' class='active'>add channel</a> to add a new channel
      </p>
    </div>

    <component v-for='channel in vm.list' :key='channel.unit' :is='getChannelType(channel)' :vm='channel' @remove='remove(channel)'></component>
  </div>
</template>
<script>
import ImageChannel from './Channels/Image';
import AudioChannel from './Channels/Audio';

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
      } else if (channelViewModel.kind === 'audio') {
        return AudioChannel;
      }
      throw new Error('Not implemented');
    },
    remove(channel) {
      this.vm.removeChannel(channel);
    },
    onInputFocused(e) {
      e.target.select();
      this.inputSelected = true;
    },
    onFilePickerChanged(e) {
      // TODO: Implement me
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
    toggleAddChannel() {
      this.showAddChannel = !this.showAddChannel;
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
@import "../shared.styl"

.channel-container {
  margin: 0 -8px;
  padding: 8px;
}
.row {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
.input-row .row {
  margin-top: 8px;
}
.help-text {
  font-size: 12px;
  font-style: italic;
  margin: 8px 0;
}
.no-channels {
  p {
    font-size: 12px;
    a {
      font-style: italic;
    }
  }
}
.channel-header {
  margin: 0 -8px;
  padding: 8px;
  a {
    width: 100%;
    text-align: center;
    display: inline-block;
  }
}
.add-channel {
  font-size: 12px;
  font-style: italic;
}
.add-channel.expanded {
}
.channel-picker {
  margin: -7px;
  padding: 8px;
  margin-bottom: 8px;
}
</style>
