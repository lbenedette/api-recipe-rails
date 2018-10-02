<template>
  <div class="columns">
    <div class="column is-8 is-offset-2">
      <p class="title has-text-centered">
        {{ recipe.title }}
        &nbsp; 
        <b-tag type="is-primary" size="is-medium">{{ recipe.category }}</b-tag>
      </p>
      <p class="subtitle has-text-centered">
        created by: {{ recipe.user_id }}
      </p>

      <figure class="has-text-centered">
        <img :src="recipe.image" :alt="recipe.title">
      </figure>
      <hr>

      <p class="title is-4">Ingredients</p>
      <p>{{ recipe.ingredients }}</p>
      <hr>

      <p class="title is-4">Steps</p>
      <p>{{ recipe.steps }}</p>
      <hr>
      <p>Posted in {{ recipe.created_at }}</p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "show",

  data() {
    return {
      recipe: {}
    };
  },

  created() {
    axios
      .get("http://localhost:3000/api/v1/recipes/" + this.$route.params.id, {
        headers: { Authorization: this.$store.getters.getToken }
      })
      .then(response => {
        this.recipe = response.data;
      })
      .catch(e => e);
  }
};
</script>

<style scoped>
</style>