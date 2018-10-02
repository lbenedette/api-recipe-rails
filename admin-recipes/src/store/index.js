import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    auth_token: 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1Mzg1NDQxODJ9.SQSV8HeKqsZOlOG-pHEDdOKP7eP17AbYX1NrCv6hTSo'
  },

  mutations: {
    setToken(state, token) {
      state.auth_token = token;
    },
  },

  getters: {
    getToken(state) {
      return state.auth_token;
    },

    isAuthenticated(state) {
      return !!state.auth_token;
    }
  }
});