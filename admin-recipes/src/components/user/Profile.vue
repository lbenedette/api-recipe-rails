<template>
  <div>
    <div class="columns">
      <div class="column">
          <p class="has-text-centered title is-3">
            {{ user.name }}
          </p>
          <p class="has-text-centered subtitle is-5">
            {{ user.email }}
          </p>
      </div>
    </div>

    <div class="columns" v-for="recipe in recipes" :key="recipe.id">
      <div class="column is-8 is-offset-2">
        <div class="box">
          <p class="title is-4 has-text-centered">
            <router-link :to="{name: 'show', params: {id: recipe.id}}" class="has-text-weight-semibold">
              {{ recipe.title }}
            </router-link>
            <b-tag
              type="is-info"
              size="is-medium">
                {{ recipe.category }}
            </b-tag>
          </p>

          <figure>
            <img :src="recipe.image" :alt="recipe.title">
          </figure>
          <hr>

          <div>
            Posted at {{ recipe.created_at | moment("MMMM Do YYYY h:mm:ss") }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "profile",

  data() {
    return {
      recipes: [],
      user: {}
    };
  },

  created() {
    axios
      .get('http://localhost:3000/api/v1/users/' + this.$route.params.id, {
        headers: { Authorization: this.$store.getters.getToken }
      })
      .then(response => {
        this.recipes = response.data.recipes;
        this.user = response.data.user;
      })
      .catch(e => e);
  }
};
</script>

<style scoped>
</style>