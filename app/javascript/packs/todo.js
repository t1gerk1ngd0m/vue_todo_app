import Vue from 'vue/dist/vue.esm.js'
import axios from "axios";
import VueAxiosPlugin from "./plugins/vue-axios";
import Router from './router/router'
import Header from './components/header.vue'

Vue.use(VueAxiosPlugin, { axios: axios })

var app = new Vue({
  router: Router,
  el: '#app',
  components: {
    'navbar': Header,
  }
});
