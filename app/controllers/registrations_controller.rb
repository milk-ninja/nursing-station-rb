class RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.ensure_auth_token
    if @user.save
      render "create.json.jbuilder", status: :created
      # mail = WelcomeMailer.welcome(@user)
      # mail.deliver_now
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end
  private
  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password, :zipcode, :avatar)
  end
end
