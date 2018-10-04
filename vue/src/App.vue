<template>
  <div>
    <nav class="navbar is-light" role="navigation" aria-label="main navigation">
      <div class="navbar-menu">
        <div class="navbar-start">
          <router-link to="/recipes" style="padding: 5px;">
            <div class="button is-text title is-5">Recipes</div>
          </router-link>
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div v-if="isAuthenticated" class="buttons">
              <router-link :to="{name: 'profile', params: {id: userId}}" v-text="userName" class="button is-text">
              </router-link>
              <button class="button is-outlined" @click="logout">
                Log out
              </button>
            </div>

            <div v-else class="buttons">
              <router-link to="/register" class="button is-success">
                Sign up
              </router-link>
              <router-link to="/login" class="button is-outlined">
                Log in
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <section class="hero">
      <div class="hero-body">
        <div class="container">
          <div class="columns">
            <div class="column is-6 is-offset-3">
              <b-message title="Danger" type="is-danger" v-if="getErrors" @close="close">
                {{ getErrors }}
              </b-message>
            </div>
          </div>
          <router-view></router-view>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'app',

  methods: {
    logout() {
      this.$store.commit('logout')
      this.$router.push('/login')
    },

    close() {
      this.$store.commit('setErrors', null);
    }
  },

  computed: {
    isAuthenticated() {
      return this.$store.getters.isAuthenticated;
    },

    userId() {
      return this.$store.getters.getUserId;
    },

    userName() {
      return this.$store.getters.getUserName;
    },

    getErrors() {
      return this.$store.getters.getErrors;
    }
  }
}
</script>

<style>

</style>
