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
              <a v-text="userName" class="button is-text">
              </a>
              <a class="button is-outlined">
                Log out
              </a>
            </div>

            <div v-else class="buttons">
              <a class="button is-success">
                <strong>Sign up</strong>
              </a>
              <a class="button is-outlined">
                Log in
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>
  
    <section class="hero">
      <div class="hero-body">
        <div class="container">
          <router-view></router-view>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'app',

  computed: {
    isAuthenticated() {
      return this.$store.getters.isAuthenticated;
    },

    userName() {
      return this.$store.getters.getUserName;
    }
  }
}
</script>

<style>

</style>
