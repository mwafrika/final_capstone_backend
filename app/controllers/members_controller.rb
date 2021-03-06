class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = user_from_token
    render json: {
      message: 'You are in !',
      user:
    }
  end

  private

  def user_from_token
    jwt_payload = JWT.decode(
      request.headers['Authorization'].split[1],
      ENV.fetch('jwt_secret_key', nil)
      # jwt.secret = Rails.application.credentials.devise[:jwt_secret_key] # Add this line in your development env
    ).first
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end
end
