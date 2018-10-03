import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    auth_token: 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1Mzg2MzU3Mzh9.pSd2JuBw5gc70aD5ZiBGvebzKzk8kLlsgzpQin_cRHc',
    user: {}
  },

  mutations: {
    setToken(state, token) {
      state.auth_token = token;
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

    getUserName(state) {
      return state.user.name;
    }
  }
});