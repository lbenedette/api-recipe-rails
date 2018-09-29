class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.result
      render json: {auth_token: command.result}
    else
      raise ApplicationController::NotAuthorized
    end
  end
end