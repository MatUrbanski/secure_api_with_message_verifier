class Api::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :restrict_access

  rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :invalid_token

  private

  def restrict_access
    authenticate_or_request_with_http_token do |authentication_token|
      params = verifier.verify(authentication_token)

      @current_user = User.find(params[:user_id])
      @current_user && params[:expires_at] > Time.now
    end
  end

  def verifier
    ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
  end

  def invalid_token
    render json: 'HTTP Token: Access denied.', status: 401
  end
end