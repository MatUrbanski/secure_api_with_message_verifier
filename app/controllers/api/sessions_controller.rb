class Api::SessionsController < Api::ApplicationController
  skip_before_action :restrict_access

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      token = verifier.generate(user_id: user.id, expires_at: Time.now + 1.hour)
      render json: token, status: 200
    else
      render json: { error: 'Wrong email or password.' }
    end
  end
end
