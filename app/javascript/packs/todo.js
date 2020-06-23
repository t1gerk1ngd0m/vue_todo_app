import Vue from 'vue/dist/vue.esm.js'
import axios from "axios";
import VueAxiosPlugin from "./plugins/vue-axios";
import router from './router/router'
import VueApollo from 'vue-apollo'
import ApolloClient from 'apollo-boost'
import Header from './components/header.vue'

const apolloClient = new ApolloClient({
  uri: "http://localhost:5000/graphql"
})

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

Vue.use(VueApollo)
Vue.use(VueAxiosPlugin, { axios: axios })

var app = new Vue({
  router,
  apolloProvider,
  el: '#app',
  components: {
    'navbar': Header,
  }
});
