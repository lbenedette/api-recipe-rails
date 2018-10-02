<template>
  <div>
    <div class="columns">
      <div class="column">
        <div class="control has-text-centered">
          <router-link to="/recipes/new" class="button is-success">
            Create Recipe
          </router-link>
        </div>
      </div>
    </div>

    <div class="columns" v-for="recipe in recipes" :key="recipe.id">
      <div class="column is-8 is-offset-2">
        <div class="box">
          <p class="title is-4">
            <router-link :to="{name: 'show', params: {id: recipe.id}}">
              {{ recipe.title }}
            </router-link>
            &nbsp; 
            <b-tag type="is-success" size="is-medium">{{ recipe.category }}</b-tag>
          </p>
          <p class="subtitle is-5">Created by: {{ recipe.user_id }}</p>
          <figure>
            <img :src="recipe.image" :alt="recipe.title">
          </figure>
          <p>Posted in {{ recipe.created_at }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "index",

  data() {
    return {
      recipes: []
    };
  },

  created() {
    axios
      .get("http://localhost:3000/api/v1/recipes", {
        headers: { Authorization: this.$store.getters.getToken }
      })
      .then(response => {
        this.recipes = response.data;
      })
      .catch(e => e);
  }
};
</script>

<style scoped>
</style>