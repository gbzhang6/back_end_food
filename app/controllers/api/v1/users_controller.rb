class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(username: params[:username], password: params[:password])

    if (@user.save)
      token = generate_token

      render json: {
        token: token,
        id: @user.id
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    #
  end
end
