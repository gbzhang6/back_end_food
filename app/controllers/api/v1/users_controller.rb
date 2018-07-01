class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])

    if (@user.save)
      token = generate_token

      render json: {
        token: token,
        id: @user.id,
        password: @user.password_digest,
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
