<template>
  <div id='app' v-if='!hideUI' :class='{"is-active": isActive, started}'>
    <div v-if='!webGLEnabled'>
      <div class='absolute no-webgl'>
        <h4>WebGL is not enabled :(</h4>
        <p>This website needs <a href='https://en.wikipedia.org/wiki/WebGL' class='highlighted'>WebGL</a> to run.</p>
        <p>You can try another browser. If problem persists - very likely your video card isn't supported then.</p>
      </div>
    </div>

    <div class='controls-container' v-if='webGLEnabled ' :style='getControlsContainerStyle()' ref='controls'>
      <div class='controls'>
        <a href='#' @click.prevent='toggleSettings' class='action'>{{(settingsPanel.collapsed ? "Edit..." : "Close Editor")}}</a>
        <a href='#' @click.prevent='generateNewFunction'>Randomize</a>
        <a href='#' @click.prevent='openShareDialog' class='share-btn' title='Share'>
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18" height="18" viewBox="0 0 12 14">
            <path d="M9.5 8q1.039 0 1.77 0.73t0.73 1.77-0.73 1.77-1.77 0.73-1.77-0.73-0.73-1.77q0-0.094 0.016-0.266l-2.812-1.406q-0.719 0.672-1.703 0.672-1.039 0-1.77-0.73t-0.73-1.77 0.73-1.77 1.77-0.73q0.984 0 1.703 0.672l2.812-1.406q-0.016-0.172-0.016-0.266 0-1.039 0.73-1.77t1.77-0.73 1.77 0.73 0.73 1.77-0.73 1.77-1.77 0.73q-0.984 0-1.703-0.672l-2.812 1.406q0.016 0.172 0.016 0.266t-0.016 0.266l2.812 1.406q0.719-0.672 1.703-0.672z"></path>
          </svg>
        </a>
      </div>
      <div v-if='settingsPanel.audioWarning' class='error'>
        This scene uses audio, which is not supported by your browser.
        Please open it on a desktop computer to explore.
      </div>
      <div class='settings' v-show='!settingsPanel.collapsed'>
        <div class='block' v-if='shaderCode'>
          <div class='title'>Code <a class='help-title' :class='{"syntax-visible": syntaxHelpVisible}' href='#' @click.prevent='syntaxHelpVisible = !syntaxHelpVisible' title='click to learn more about syntax'>syntax help</a></div>
          <syntax v-if='syntaxHelpVisible' @close='syntaxHelpVisible = false'></syntax>
          <code-editor :model='shaderCode' ></code-editor>
          <div class='code-limit' v-if='settingsPanel.codeLimitError'>
            Warning, the length of the code exceeds what can be saved in the query string.
            If you intend to share it, you will need to use `gist` parameter. <a href='https://github.com/anvaka/pplay#query-string-limit' target='_blank'>Read more here</a>.
          </div>
          <div class='gist-error' v-if='settingsPanel.loadError'>
            We could not load the gist. Editor is set to default code. The error was:
            <pre>{{settingsPanel.loadError}}</pre>
          </div>
        </div>
        <channels class='block top-offset' :vm='channelsState'></channels>
        <div class='block top-offset status-bar' v-if='shaderCode'>
          <a href="#" @click.prevent='goToOrigin'>Go to origin</a>
          <a href="?">Reset all</a>
        </div>
      </div>
      <div ref='left' class='left resize'></div>
    </div>
    <share @close='shareVisible = false' @open='shareVisible = true'></share>
    <about @close='aboutVisible = false' v-if='aboutVisible'></about>
    <a href='#' @click.prevent='aboutVisible = !aboutVisible' class='about-link' title='click to learn more about this website'>about...</a>
  </div>
</template>

<script>
import CodeEditor from './components/CodeEditor';
import Channels from './components/Channels';
import Share from './components/Share';
import About from './components/About';
import HelpIcon from './components/HelpIcon';
import Syntax from './components/Syntax';

var MIN_SETTINGS_WIDTH = 456;
var bus = require('./bus');
var createDrag = require('./util/drag.js');
var isSmallScreen = require('./util/isSmallScreen.js');
var generateRandomScene = require('./util/generateRandomScene.js');

var appState = require('./appState');

export default {
  name: 'App',
  components: {
    HelpIcon,
    Channels,
    Syntax,
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
    // trigger smooth animation when first time loaded.
    setTimeout(() => this.started = false);
  },
  beforeDestroy() {
    this.resizer.dispose();
    bus.off('scene-ready', this.onSceneReady, this);
    window.removeEventListener('resize', this.updateControlsStyle, true);
  },
  computed: {
    isActive() {
      if (!this.scene) return false;
      if (this.settingsPanel.audioWarning) return true;
      return (this.scene.isActive) || this.aboutVisible || this.shareVisible;
    },
  },
  data() {
    return {
      started: true,
      scene: window.scene,
      syntaxHelpVisible: false,
      hideUI: appState.hideUI,
      shareVisible: false,
      aboutVisible: false,
      width: MIN_SETTINGS_WIDTH,
      webGLEnabled: window.webGLEnabled,
      settingsPanel: appState.settingsPanel,
      shaderCode: window.scene && window.scene.codeEditorState,
      channelsState: window.scene && window.scene.channelsState
    }
  },
  methods: {
    getControlsContainerStyle() {
      if (isSmallScreen()) return { width: '100%' };

      return {width: this.width + 'px'};
    },
    updateControlsStyle() {
      var controls = this.$refs.controls;
      if (!controls) return; // Running in hide-ui=1 mode
      controls.style.width = this.getControlsContainerStyle().width;
    },
    toggleSettings() {
      this.settingsPanel.collapsed = !this.settingsPanel.collapsed;
      bus.fire('settings-collapsed', this.settingsPanel.collapsed);
      // When settings panel is collapsed, we may also want to auto-hide
      // all UI eventually.
      this.scene.setActivityMonitorEnabled(this.settingsPanel.collapsed);
    },
    onSceneReady(scene) {
      this.scene = scene
      this.shaderCode = scene.codeEditorState;
      this.channelsState = scene.channelsState;
    },
    goToOrigin() {
      this.scene.goToOrigin();
    },
    openShareDialog() {
      bus.fire('open-share-dialog');
    },
    generateNewFunction() {
      this.scene.codeEditorState.setCode(generateRandomScene());
      this.scene.goToOrigin();
    },
  }
}
</script>

<style lang='stylus'>
@import './styles/app.styl';
@import './shared.styl';

help-background = rgb(7, 12, 23);
.help {
  margin: -7px;
  margin-bottom: 7px;
  padding: 7px 7px 14px 7px;
  background: help-background;
}

a.help-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 25px;
  margin-right: -7px;
  svg {
    fill: secondary-text;
  }
  &.open {
    background: help-background;
    svg {
      fill: primary-text;
    }
  }
}
.row.help {
  margin-top: 0;
}
#app {
  opacity: 0;
  transition-timing-function: ease-out;
  transition: 2s;

  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
#app.is-active {
  opacity: 1;
  transition: 200ms;
  transition-timing-function: ease-out;
}
#app.started {
  opacity: 0;
}
.top-offset {
  margin-top: 14px;
}
.controls-container {
  z-index: 1;
  position: absolute;
  max-height: 100%;
  box-shadow: 0 2px 4px rgba(0,0,0,0.2);

  border: 1px solid secondary-border;
  border-left: none;
  border-top: none;
  overflow: hidden;
  flex-direction: column;
  display: flex;
}
.nodisplay {
  display: none;
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

pre.error, .gist-error {
  background: severe-error-background;
  color: #ffff;
  margin: 0px -8px;
  padding: 0 8px;
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
    border-left: 1px solid secondary-border;
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
.status-bar {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  font-size: 12px;
}

.settings {
  flex: 1;
  color: secondary-text;
  left: 0;
  overflow-y: auto;
  border-top: 1px solid secondary-border;
  background: window-background;
  width: 100%;
  padding: 7px 7px 7px 7px;

  a.help-title {
    float: right;
    font-size: 12px;
    font-style: italic;
    color: #267fcd;
    height: 30px;
    margin: -5px;
    padding: 7px;
  }
  a.syntax-visible {
    background: help-background;
    color: white;
    font-style: normal;
  }
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
  left: 0;
  bottom: 0;
  height: 42px;
  padding-left: 7px;
  display: flex;
  align-items: center;
  width: 83px;
}

.code-limit {
  font-size: 12px;
  background: help-background;
  margin: 12px -8px;
  padding: 8px;
}

@media (max-width: small-screen) {
  .controls {
    a.share-btn {
      flex: none;
      display: flex;
      width: 42px;
    }
  }
  a.about-link {
    bottom: 0;
  }

  .controls-container {
    width: 100%;
  }
}
</style>
