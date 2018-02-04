<template>
<div>
  <span class='audio-title'>Audio is bound to <pre class='inline primary-text'>{{vm.name}}</pre>.
  To learn how to use it, please <a href='https://github.com/anvaka/pplay#audio-channel' target='_blank' class=''>read here</a>.
  </span>
  <div class='audio-channel' v-show='audioReady'>
    <div class='audio-container'>
      <audio ref='player' controls='' autoplay='true' preload autobuffer></audio>
    </div>
    <a href='#' @click.prevent='remove' class='remove'>Remove</a>
  </div>
  <div v-if='vm.state === "loading"'>
    Loading audio into <pre class='inline primary-text'>{{vm.name}}</pre>...
  </div>
  <div v-if='vm.state === "error"' class='error'>
    Failed to load "{{vm.src}}".
    <a href='#' @click.prevent='remove' class='remove'>Remove</a>
  </div>
</div>
</template>
<script>
export default {
  name: 'AudioChannel',
  props: ['vm'],
  computed: {
    audioReady() {
      return this.vm && this.vm.state === 'ready';
    }
  },
  watch:{
    audioReady() {
      this.vm.model.initPlayer(this.$refs.player);
    }
  },
  methods: {
    remove() {
      this.$emit('remove');
    }
  }
}
</script>

<style lang='stylus'>
@import "../../shared.styl";
.error {
  background: severe-error-background;
  color: primary-text;
  padding: 8px;
  a {
    border-bottom: 1px dashed;
  }
}

pre.inline {
  display: inline;
}
.audio-title {
  font-size: 12px;
}

.audio-channel {
  display: flex;
  flex-direction: row;
  height: 60px;
  padding: 8px;
  margin: 0 -8px;
  align-items: center;
  .audio-container {
    flex: 1;
    padding: 0 8px 0 0;
    audio {
      width: 100%;
    }
  }
  .remove {
    font-size: 12px;
    align-self: stretch;
    align-items: center;
    display: flex;
  }
}
</style>

