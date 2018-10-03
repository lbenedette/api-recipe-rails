<template>
  <div class="columns">
    <div class="column is-10 is-offset-1">
      <p class="title has-text-grey-dark has-text-weight-semibold has-text-centered">
        {{ recipe.title }}
        <b-tag
          type="is-info"
          size="is-medium">
            {{ recipe.category }}
        </b-tag>
      </p>
      <p class="subtitle has-text-centered">
        Chef 
        <router-link :to="{name: 'profile', params: {id: recipe.user_id}}">
          {{ recipe.user_name }}
        </router-link>
      </p>

      <figure class="has-text-centered">
        <img :src="recipe.image" :alt="recipe.title">
      </figure>

      <hr>

      <div class="columns">
        <div class="column has-text-left">
          Posted at {{ recipe.created_at | moment("MMMM Do YYYY h:mm:ss") }}
          <br>
          Last update at {{ recipe.updated_at | moment("MMMM Do YYYY h:mm:ss") }}
        </div>

        <div class="buttons has-text-righ">
          <router-link :to="{name: 'edit', params: {id: recipe.id}}" class="button is-warning">
            Edit
          </router-link>
          <div @click="deleteRecipe" class="button is-danger">
            Delete
          </div>
        </div>
      </div>

      <div class="columns">
        <div class="column is-8">
          <p class="title is-4 has-text-grey-dark">Ingredients</p>
          <p class="has-text-justified	">{{ recipe.ingredients }}</p>
          <br>
          <p class="title is-4 has-text-grey-dark">Steps</p>
          <p class="has-text-justified	">{{ recipe.steps }}</p>
        </div>
        <div class="column">
          <p class="title is-4 has-text-grey-dark">Times</p>
          <u>
            <li>Preparation time: {{ recipe.preparation_time }} hours.</li>
            <li>Oven time: {{ recipe.oven_time }} hours</li>
          </u>
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
          .then(() => {
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
        console.log(response.data);
        this.recipe = response.data;
      })
      .catch(e => e);
  }
};
</script>

<style scoped>
</style>