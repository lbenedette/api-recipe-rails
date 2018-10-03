<template>
  <div class="column is-4 is-offset-4">
    <div class="box">
      <h1 class="title has-text-centered">
        Recipes
      </h1>

      <b-field label="Email">
        <b-input
          type="email"
          v-model="email">
        </b-input>
      </b-field>

      <b-field label="Password">
        <b-input
          type="password"
          v-model="password"
          password-reveal>
        </b-input>
      </b-field>

      <div class="control has-text-centered">
        <button class="button is-success is-fullwidth" @click="authenticate">Login</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Login",

  methods: {
    authenticate() {
      axios
        .post("http://localhost:3000/authenticate", {
          email: this.email,
          password: this.password
        })
        .then(response => {
          this.$store.commit("setToken", response.data.auth_token);
          this.$store.commit("setUser", response.data.user);
          this.$router.push('/recipes');
        })
        .catch(e => (e));
    }
  },

  data() {
    return {
      email: "",
      password: ""
    };
  }
};
</script>

<style>
</style>