class RatingsController < ApplicationController
  before_action :authenticate!, only: [:create]
  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @rating.error.full_messages },
             status: :unprocessable_entity
    end
  end

  private
  def rating_params
    params.permit(:user_id, :place_id, :comment, :privacy, :cleanliness )
  end
end
