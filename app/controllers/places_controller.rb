class PlacesController < ApplicationController
  before_action :authenticate!, only: [:check_auth]

  def create
    @place = Place.new(place_params)
    if @place.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @place.errors.full_messages },
             status: :inprocessable_entity
    end
  end

  private
  def place_params
    params.permit(:name, :address, :description, :lat, :long)
  end
end
