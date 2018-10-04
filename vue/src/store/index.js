import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    auth_token: '',
    user: {},
    errors: ''
  },

  mutations: {
    setToken(state, token) {
      state.auth_token = token;
    },

    setUser(state, user) {
      state.user = user;
    },

    setErrors(state, errors) {
      state.errors = errors;
    },

    logout(state) {
      state.auth_token = '';
      state.user = {};
    }
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
    },

    getErrors(state) {
      return state.errors;
    }
  }
});