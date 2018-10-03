<template>
  <div>
    <div class="column">
      <p class="title has-text-centered">
        {{ title }}
      </p>
    </div>

    <b-field label="Title">
      <b-input v-model="recipe.title">
      </b-input>
    </b-field>

    <b-field label="Category">
      <div class="select is-fullwidth">
        <select
          placeholder="Select a category"
          v-model="recipe.category">
            <option
              v-for="option in [
                {category: 'entree'},
                {category: 'desert'},
                {category: 'apettizer'},
                {category: 'snack'},
              ]"
              :value="option.category"
              :key="option.category">
              {{ option.category }}
            </option>
        </select>
      </div>
    </b-field>

    <b-field label="Preparation Time">
      <b-input
        type="number"
        min="0"
        step="0.5"
        v-model="recipe.preparation_time">
      </b-input>
    </b-field>

    <b-field label="Oven Time">
      <b-input
        type="number"
        min="0"
        step="0.5"
        v-model="recipe.oven_time">
      </b-input>
    </b-field>

    <b-field label="Ingredients">
      <b-input
        type="textarea"
        v-model="recipe.ingredients">
      </b-input>
    </b-field>

    <b-field label="Steps">
      <b-input
        type="textarea"
        v-model="recipe.steps">
      </b-input>
    </b-field>

    <b-field class="file">
      <b-upload v-model="recipe.image">
          <a class="button is-primary">
              <b-icon icon="upload"></b-icon>
              <span>Upload Image</span>
          </a>
      </b-upload>
      <span class="file-name"
          v-if="recipe.image && recipe.image.length">
          {{ recipe.image[0].name }}
      </span>
    </b-field>

    <div class="columns">
      <div class="column">
        <div class="control has-text-left">
          <router-link to="/recipes" class="button is-outlined">
            Cancel
          </router-link>
        </div>
      </div>

      <div class="column">
        <div class="control has-text-right">
          <button class="button is-info" @click="submit">Confirm</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'form',

  props: ['recipe', 'title'],

  methods: {
    submit() {
      let self = this;
      this.$emit('formSubmit', self.recipe);
    }
  }
};
</script>

<style scoped>
</style>