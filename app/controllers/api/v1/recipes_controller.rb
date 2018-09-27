module Api
  module V1
    class RecipesController < ApplicationController
      def index
        recipes = Recipe.order('created_at DESC')
        render json: {status:'success', message:'Receitas carregadas', data:recipes}, status: :ok
      end

      def show
        recipe = Recipe.find(params[:id])
        render json: {status:'success', message:'Receita carregada', data:recipe}, status: :ok
      end

      def create
        recipe = Recipe.new(recipe_params)
        if recipe.save
          render json:{status:'success', message:'Receita criada', data:recipe}, status: :ok
        else
          render json:{status:'error', message:'Receita não salva', data:recipe.errors}, status: :unprocessable_entity
        end
      end

      def update
        recipe = Recipe.find(params[:id])
        if recipe.update_attributes(recipe_params)
          render json:{status:'success', message:'Receita atualizada', data:recipe}, status: :ok
        else
          render json:{status:'error', message:'Receita não atualizada', data:recipe.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        recipe = Recipe.find(params[:id])
        recipe.destroy
        render json:{status:'success', message:'Receita deletada', data:[]}, status: :ok
      end

      private
      def recipe_params
        params.permit(:title, :category, :preparation_time, :oven_time, :ingredients, :steps, :image)
      end
    end
  end
end