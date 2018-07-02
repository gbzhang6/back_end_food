class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
      @user = User.new(user_params)

      @user.username = params[:username]
      @user.password = params[:password]
    if (@user.save)
      token = generate_token

      render json: {
        token: token,
        id: @user.id,
        password: @user.password,
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
