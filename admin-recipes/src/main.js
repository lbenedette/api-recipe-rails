import Vue from 'vue'
import Buefy from 'buefy';
import VueRouter from 'vue-router'
import VueMoment from 'vue-moment'

import App from './App.vue'

import 'buefy/dist/buefy.css';

import {routes} from './routes'
import store from './store'

Vue.use(Buefy);
Vue.use(VueRouter);
Vue.use(VueMoment);
Vue.config.productionTip = false;

const router = new VueRouter({
  mode: 'history',
  routes
});

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app');
