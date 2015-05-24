def json
  @json ||= JSON.parse(response.body)
end

def set_http_authorization_header(user)
  verifier = ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
  token = verifier.generate(user_id: user.id, expires_at: Time.now + 1.hour)
  request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(token)
end