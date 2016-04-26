class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user
  def current_user
    token = request.headers["Auth-Token"]
    if token
      User.find_by(auth_token: token)
    end
  end

  def authenticate!
    unless current_user
      render json: {errors: "You need to be logged in to do this."},
             status: :unauthorized
    end
  end
  # helper_method :current_user
  #
  # def current_user
  #   user_id = session[:user_id]
  #   user_id && User.find_by(id: user_id)
  # end

  # def administrate!
  #   unless current_user && current_user.admin?
  #     flash[:notice] = "This portion of the site is for admins only. Sorry."
  #     redirect_to root_path
  #   end
  # end
end
