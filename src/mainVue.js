/**
 * This is the entry point to the vue app. It manages code editor, about, etc.
 * The main entry point is in the nativeMain.js
 */
import Vue from 'vue'
import App from './App'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  template: '<App/>',
  components: { App }
})
