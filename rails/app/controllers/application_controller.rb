class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user
  # best place to put this?
  NotAuthorized = Class.new(StandardError)

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {errors: "Not found"}, status: 404
  end

  rescue_from ApplicationController::NotAuthorized do |exception|
    render json: {errors: "Not authorized"}, status: 401
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    raise ApplicationController::NotAuthorized unless @current_user
  end
end
