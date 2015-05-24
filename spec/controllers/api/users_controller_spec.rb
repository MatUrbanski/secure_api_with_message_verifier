require 'rails_helper'

describe Api::UsersController do
  let(:user) { User.create(email: 'test@user.com', password: 'password') }
  before { set_http_authorization_header(user) }

  describe 'GET #index' do
    it 'return all users' do
      get :index

      expect(json.size).to eq 1
      expect(response.status).to eq 200
    end
  end
end