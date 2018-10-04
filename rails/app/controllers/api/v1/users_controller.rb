module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request, :except => [:show]

      def show
        user = User.find(params[:id])
        data = {:user => user, :recipes => user.recipes}
        render json: data, status: :ok
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: {data: user}, status: :ok
        else
          render json: {errors: user.errors}, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end