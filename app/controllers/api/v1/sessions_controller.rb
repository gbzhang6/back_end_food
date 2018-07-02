class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params["username"])

    if (@user && @user.authenticate(params["password"]))
      token = generate_token
      render json: {
        token: token,
        id: @user.id,
        username: @user.username
      }
    else
      render json: {
        errors: "User is not valid"
      }, status: :unauthorized
    end
  end

  def show
    if current_user
      token = generate_token

      render json: {
        token: token,
        id: current_user.id,
        username: current_user.username
      }
    else
      render({json: {error: 'Token is not valid'}, status: 401})
    end
  end

end
