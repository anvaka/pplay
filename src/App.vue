<template>
  <div id='app'>
    <div v-if='!webGLEnabled'>
      <div class='absolute no-webgl'>
        <h4>WebGL is not enabled :(</h4>
        <p>This website needs <a href='https://en.wikipedia.org/wiki/WebGL' class='highlighted'>WebGL</a> to run.</p>
        <p>You can try another browser. If problem persists - very likely your video card isn't supported then.</p>
      </div>
    </div>

    <div class='controls-container' v-if='webGLEnabled' :style='getControlsContainerStyle()' ref='controls'>
      <div class='controls'>
        <a href='#' @click.prevent='toggleSettings' class='action'>{{(settingsPanel.collapsed ? "Edit..." : "Close Editor")}}</a>
        <a href='#' @click.prevent='generateNewFunction'>Randomize</a>
        <a href='#' @click.prevent='openShareDialog' class='share-btn' title='Share'>
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18" height="18" viewBox="0 0 12 14">
            <path d="M9.5 8q1.039 0 1.77 0.73t0.73 1.77-0.73 1.77-1.77 0.73-1.77-0.73-0.73-1.77q0-0.094 0.016-0.266l-2.812-1.406q-0.719 0.672-1.703 0.672-1.039 0-1.77-0.73t-0.73-1.77 0.73-1.77 1.77-0.73q0.984 0 1.703 0.672l2.812-1.406q-0.016-0.172-0.016-0.266 0-1.039 0.73-1.77t1.77-0.73 1.77 0.73 0.73 1.77-0.73 1.77-1.77 0.73q-0.984 0-1.703-0.672l-2.812 1.406q0.016 0.172 0.016 0.266t-0.016 0.266l2.812 1.406q0.719-0.672 1.703-0.672z"></path>
          </svg>
        </a>
      </div>
      <div class='settings' v-if='!settingsPanel.collapsed'>
        <div class='block' v-if='shaderCode'>
          <div class='title'>Code</div>
          <code-editor :model='shaderCode' ></code-editor>
        </div>
        <div class='block top-offset' v-if='shaderCode'>
          <a href="#" @click.prevent='goToOrigin'>Go to origin</a>
        </div>
      </div>
      <div ref='left' class='left resize'></div>
    </div>
    <share></share>
    <about @close='aboutVisible = false' v-if='aboutVisible'></about>
    <a href='#' @click.prevent='aboutVisible = !aboutVisible' class='about-link' title='click to learn more about this website'>about...</a>
  </div>
</template>

<script>
import CodeEditor from './components/CodeEditor';
import Share from './components/Share';
import About from './components/About';

var MIN_SETTINGS_WIDTH = 456;
var bus = require('./bus');
var createDrag = require('./util/drag.js');
var isSmallScreen = require('./util/isSmallScreen.js');
var generateRandomScene = require('./util/generateRandomScene.js');

var appState = require('./appState');
var scene = window.scene;

export default {
  name: 'App',
  components: {
    CodeEditor,
    Share,
    About
  },
  mounted() {
    bus.on('scene-ready', this.onSceneReady, this);
    window.addEventListener('resize', this.updateControlsStyle, true);

    this.resizer = createDrag(this.$refs.left, dx => {
      this.width += dx;
      if (this.width < MIN_SETTINGS_WIDTH) this.width = MIN_SETTINGS_WIDTH;
    });
  },
  beforeDestroy() {
    this.resizer.dispose();
    bus.off('scene-ready', this.onSceneReady, this);
    window.removeEventListener('resize', this.updateControlsStyle, true);
  },
  data() {
    return {
      aboutVisible: false,
      width: MIN_SETTINGS_WIDTH,
      webGLEnabled: window.webGLEnabled,
      settingsPanel: appState.settingsPanel,
      shaderCode: scene.codeEditorState
    }
  },
  methods: {
    getControlsContainerStyle() {
      if (isSmallScreen()) return { width: '100%' };

      return {width: this.width + 'px'};
    },
    updateControlsStyle() {
      this.$refs.controls.style.width = this.getControlsContainerStyle().width;
    },
    toggleSettings() {
      this.settingsPanel.collapsed = !this.settingsPanel.collapsed;
    },
    onSceneReady() {
      this.shaderCode = scene.codeEditorState;
    },
    goToOrigin() {
      scene.goToOrigin();
    },
    openShareDialog() {
      bus.fire('open-share-dialog');
    },
    generateNewFunction() {
      window.scene.codeEditorState.setCode(generateRandomScene());
    },
  }
}
</script>

<style lang='stylus'>
@import './styles/app.styl';
@import './shared.styl';
@import "./styles/glsl-theme.styl";

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.top-offset {
  margin-top: 14px;
}
.controls-container {
  position: absolute;
  max-height: 100%;
  box-shadow: 0 2px 4px rgba(0,0,0,0.2);

  border: 1px solid primary-border;
  border-left: none;
  border-top: none;
  overflow: hidden;
  flex-direction: column;
  display: flex;
}
.no-webgl {
  width: 100%;
  color: rgb(190, 190, 190)
  flex-direction: column; text-align: center;
  padding: 12px;
}
.no-webgl h4 {
  margin: 7px 0;
  font-size: 24px;
}
.controls-container {
}
.resize {
  position: absolute;
}
.resize.left {
  right: -2px;
  height: 100%;
  width: 4px;
  cursor: ew-resize;
  background: transparent;
  top: 0;
}
a {
  text-decoration: none;
}
pre.error {
  background: #f52c5e;
  color: #ffff;
  margin: 0;
}
.controls {
  display: flex;
  flex-shrink: 0;
  height: control-bar-height;
  width: 100%;
  background-color: window-background;

  a {
    padding: 8px;
    display: flex;
    flex: 1;
    border-left: 1px solid secondary-text;
    justify-content: center;
    align-items: center;
  }

  a:first-child {
    border-left: 0;
  }
  a.share-btn {
    display: none;
    svg {
      fill: white;
    }
  }
  a.toggle-pause {
    flex: 0.3;
  }
}

@media (max-width: small-screen) {
  .controls {
    a.share-btn {
      flex: none;
      display: flex;
      width: 42px;
    }
  }
}

.settings {
  flex: 1;
  color: secondary-text;
  left: 0;
  overflow-y: auto;
  border-top: 1px solid secondary-text;
  background: window-background;
  width: 100%;
  padding: 7px 7px 7px 7px;
}
.settings.collapsed {
  display: none;
}

.title {
  margin-bottom: 7px;
  color: primary-text;
  font-size: 18px;
}

.block {
  .col {
    align-items: center;
    display: flex;
  }
  .row {
    margin-top: 4px;
  }
  select {
    margin-left: 14px;
  }

  input[type='text'],
  input[type='number'] {
    background: transparent;
    color: primary-text;
    border: 1px solid transparent;
    padding: 7px;
    font-size: 16px;
    width: 100%;
    margin-left: 7px;
    &:focus {
      outline-offset: 0;
      outline: none;
      border: 1px dashed;
      background: #13294f;
    }
    &:invalid {
      box-shadow:none;
    }
  }
}

a.about-link {
  position: absolute;
  left: 7px;
  bottom: 26px;
}

@media (max-width: small-screen) {
  a.about-link {
    bottom: 14px;
  }

  .controls-container {
    width: 100%;
  }
}
</style>
