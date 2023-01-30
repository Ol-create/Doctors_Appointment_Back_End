class SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:id] = user.id
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { logged_in: true, user:, jwt: token, success: "Welcome back, #{user.name}" }
    else
      render json: { error: 'There was an error with your login, please check your Username and Password' }
    end
  end

  def logout
    session.clear
    render json: {
      logged_in: false
    }
  end
end
