class RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.ensure_auth_token
    if @user.save
      render json: { user: @user.as_json(only: [:first_name, :last_name, :email, :auth_token ]) },
             status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end
binding.pry
  private
  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password, :zipcode)
  end
end
