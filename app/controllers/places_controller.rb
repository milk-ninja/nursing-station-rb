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
  def show
  end

  def index
    @places = Place.all
    render "index.json.jbuilder", status: :ok
  end

  # def full_address
  #   params.permit(:street, :city, :state, :zip)
  # end

  private
  def place_params
    params.permit(:name, :street, :city, :state, :zip, :description, :lat, :long)
  end

end
