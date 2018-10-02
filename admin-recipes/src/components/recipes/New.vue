<template>
  <div>
    <div class="column is-6 is-offset-3">
      <div class="box">
        <Form :recipe="recipe" title="Create a new recipe!" @formSubmit="createRecipe"></Form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Form from './Form'

export default {
  name: "new",

  components: {
    Form
  },

  methods: {
    createRecipe(recipe) {
      axios({
        method: 'post',
        url: 'http://localhost:3000/api/v1/recipes',
        headers: { Authorization: this.$store.getters.getToken },
        data: {
          ...recipe
        }
      })
      .then(response => {
        this.$router.push('/recipes');
      })
      .catch(e => e);
    }
  },

  data() {
    return {
      recipe: {
        title: '',
        category: '',
        preparation_time: '',
        oven_time: '',
        ingredients: '',
        steps: '',
        image: ''
      }
    }
  }
};
</script>

<style scoped>
</style>