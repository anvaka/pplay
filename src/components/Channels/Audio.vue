<template>
<div>
  <div class='audio-channel' v-show='audioReady'>
    <div class='audio-container'>
      <audio ref='player' controls='' autoplay='' preload autobuffer></audio>
    </div>
    <div class='info'>
    </div>
    <a href='#' @click.prevent='remove' class='remove'>Remove</a>
  </div>
  <div v-if='vm.state === "loading"'>
    Loading image into <pre>{{vm.name}}</pre>...
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

.image-channel {
  display: flex;
  flex-direction: row;
  height: 60px;
  padding: 8px;
  margin: 0 -8px;
  align-items: center;
  .info {
    flex: 1;
    padding-left: 8px;
    i {
      font-family: monospace;
      color: primary-text;
    }
  }
  .img-container {
    width: 60px;
    display: flex;
    align-items: baseline;

    img {
      width: 100%;
      height: auto;
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

