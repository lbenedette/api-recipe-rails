import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    auth_token: '',
    user: {}
  },

  mutations: {
    setToken(state, token) {
      state.auth_token = token;
    },

    logout(state) {
      state.auth_token = '';
      state.user = {};
    },

    setUser(state, user) {
      state.user = user;
    },
  },

  getters: {
    getToken(state) {
      return state.auth_token;
    },

    isAuthenticated(state) {
      return !!state.auth_token;
    },

    getUserId(state) {
      return state.user.id;
    },

    getUserName(state) {
      return state.user.name;
    }
  }
});