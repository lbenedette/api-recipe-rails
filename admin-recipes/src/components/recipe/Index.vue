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

          <p class="subtitle is-6">
            Created by
            <a>
              {{ recipe.user_name }}
            </a>
            {{ recipe.created_at | moment("from") }}.
          </p>

          <figure>
            <img :src="recipe.image" :alt="recipe.title">
          </figure>
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