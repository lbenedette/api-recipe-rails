<template>
  <div>
    <div class="column is-6 is-offset-3">
      <div class="box">
        <h1 class="title has-text-centered">
          Register
        </h1>

        <b-field label="Name">
          <b-input v-model="user.name">
          </b-input>
        </b-field>

        <b-field label="Email">
          <b-input
            type="email"
            v-model="user.email">
          </b-input>
        </b-field>

        <b-field label="Password">
          <b-input
            type="password"
            v-model="user.password"
            password-reveal>
          </b-input>
        </b-field>

        <b-field label="Password Confirmation">
          <b-input
            type="password"
            v-model="user.password_confirmation"
            password-reveal>
          </b-input>
        </b-field>

        <div class="control has-text-centered">
          <button class="button is-success is-fullwidth" @click="register">Confirm</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "register",

  methods: {
    register() {
      axios({
        method: "post",
        url: "http://localhost:3000/api/v1/users",
        headers: { Authorization: this.$store.getters.getToken },
        data: {
          ...this.user
        }
      })
        .then(response => {
          this.$router.push("/login");
        })
        .catch(e => e);
    }
  },

  data() {
    return {
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: ""
      }
    };
  }
};
</script>

<style scoped>
</style>