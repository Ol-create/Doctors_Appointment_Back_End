class ApplicationController < ActionController::API
  def current_user
    User.first
  end

  def encode_token(payload)
    JWT.encode(payload, 'my_secret')
  end
end
