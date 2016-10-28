class PlacesController < ApplicationController
  before_action :authenticate!, only: [:check_auth]

  def spots(name, type, radius)
    @client = GooglePlaces::Client.new(ENV["PLACES_API_KEY"])
    a = @client.spots(33.756888, -84.3918611, :name => name.to_s, :type => type.to_s, :radius => radius.to_i)
    new_places = a.reject {|place| place.name.length = name.length}
    @places = new_places.map do |x|
      name = x.name
      street = x.vicinity.split(",").first
      city = x.vicinity.split(",").last
      avatar = x.photos[0].fetch_url(800)
      place = Place.create(name: name, street: street, city: city, state: "Ga", lat: x.lat, lng: x.lng, avatar: avatar)
    end
    # json.saved place.persisted?
    render "spots.json.jbuilder", status: :ok
  end

  def create
    @place = Place.new(place_params)
    @rating = @place.ratings.new(rating_params)
    if @place.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @place.errors.full_messages },
             status: :inprocessable_entity
    end
  end

  def show
    @place = Place.find_by!(id: params["id"])
    render "show.json.jbuilder"
  end

  def index
    @places = Place.all
    render "index.json.jbuilder", status: :ok
  end

  def find_nearby
    @places = Place.near([params[:lat], params[:lng]], 10)
    render "find_nearby.json.jbuilder"
  end

  def edit
    @place = Place.find_by!(id: params["id"])
    render "edit.json.jbuilder"
  end

  # def update
  #   @place = Place.find_by!(id:params["id"])
  #   if @place.update_attributes(place_params)


  private
  def place_params
    params.permit(:name, :street, :city, :state, :zip, :description, :lat, :lng, :avatar)
  end

  def rating_params
    params.permit(:user_id, :place_id, :comment, :privacy, :cleanliness )
  end

  def image_params
    params.permit(:rating_id, :image)
  end
end
