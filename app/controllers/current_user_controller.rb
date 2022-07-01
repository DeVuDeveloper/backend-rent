class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end

  def update
    user = current_user
    if user.update(user_update_params)
      render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_update_params
    params.require(:user).permit(:image,:image_url)
  end
end
