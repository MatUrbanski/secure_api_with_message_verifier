class Api::UsersController < Api::ApplicationController
  def index
    render json: User.all, status: 200
  end
end
