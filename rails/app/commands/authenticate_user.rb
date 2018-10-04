class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :user

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    @user = User.find_by_email(@email)
    if @user && @user.authenticate(@password)
      return JsonWebToken.encode(user_id: @user.id)
    end
    errors.add :user_authentication, ''
    false
  end
end