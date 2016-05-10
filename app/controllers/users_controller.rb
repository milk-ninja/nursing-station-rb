class UsersController < ApplicationController
  before_action :authenticate!, only: [:check_auth]

 def login
<<<<<<< HEAD
    @user = User.find_by!(first_name: params["first_name"])
    if @user.authenticate(params[:password])
      render json: { user: @user.as_json(only:[:first_name, :auth_token, :id]) },
=======
    @user = User.find_by!(username: params["username"])
    if @user.authenticate(params[:password])
      render "login.json.jbuilder",
>>>>>>> 53c7bdbdabe9d5f212e0e8a303b1e80f09156319
             status: :ok
    else
      render json: { message: "Username or password could not be found." },
             status: :unauthorized
    end
  end

  def check_auth
    if current_user
      render json: { message: "Logged in as #{current_user.first_name}" },
             status: :ok
    else
      render json: { message: "Auth isn't working yet." },
<<<<<<< HEAD
              status: :unauthorized
=======
             status: :unauthorized
>>>>>>> 53c7bdbdabe9d5f212e0e8a303b1e80f09156319
    end
  end
end
