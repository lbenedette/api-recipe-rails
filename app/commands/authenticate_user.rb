class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = User.find_by_email(@email)
    user = user.authenticate(@password)
    JsonWebToken.encode(user_id: user.id)
  end

  # private
  # def user
  #   user = User.find_by_email(email)
  #   return user if user && user.authenticate(password)
  #
  #   errors.add :user_authentication, "Invalid credentials"
  # end
end