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

      <div class="columns">
        <div class="column has-text-left">
          Posted at {{ recipe.created_at }}
          <br>
          Last update at {{ recipe.updated_at }}
        </div>

        <div class="column control has-text-right">
          <button @click="deleteRecipe" class="button is-danger">
            Delete
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "show",

  methods: {
    deleteRecipe() {
      if (confirm('Delete the recipe ' + this.recipe.title + ' ?')) {
        axios
          .delete("http://localhost:3000/api/v1/recipes/" + this.$route.params.id, {
            headers: { Authorization: this.$store.getters.getToken }
          })
          .then(response => {
            this.$router.push('/recipes');
          })
          .catch(e => e);
        return;
      }
    }
  },

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