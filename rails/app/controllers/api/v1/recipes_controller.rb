module Api
  module V1
    class RecipesController < ApplicationController
      def index
        # ideia 1: Add pagination
        # ideia 2: Add filter by category
        recipes = Recipe.select('recipes.*, users.name as user_name')
          .joins(:user)
          .order('recipes.created_at DESC')
        render json: recipes, status: :ok
      end

      def show
        recipe = Recipe.select('recipes.*, users.name as user_name')
          .joins(:user)
          .where('recipes.id = ' + params[:id])
          .first()
        render json: recipe, status: :ok
      end

      def create
        recipe = Recipe.new(recipe_params)
        # current user is the creator of the recipe
        recipe.user_id = current_user.id
        if recipe.save
          render json: recipe, status: :ok
        else
          render json: {errors: recipe.errors}, status: :unprocessable_entity
        end
      end

      def update
        recipe = Recipe.find(params[:id])
        if recipe.update_attributes(recipe_params)
          render json: recipe, status: :ok
        else
          render json: {errors: recipe.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        recipe = Recipe.find(params[:id])
        if recipe.destroy
          render status: :ok
        else
          render json: {errors: recipe.errors}, status: :unprocessable_entity
        end
      end

      private

      def recipe_params
        params.permit(:title, :category, :preparation_time, :oven_time, :ingredients, :steps, :image)
      end
    end
  end
end