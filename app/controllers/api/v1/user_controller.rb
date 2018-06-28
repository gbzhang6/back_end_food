class Api::V1::UserController < ApplicationController
  before_action :requires_login, only: [:users_snacks]
  before_action :requires_user_match, only: [:users_snacks]

  def create
    @user = User.new

    @user.username = params[:username]
    @user.password = params[:password]

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

  end
  
end
