json.place @place, :id, :name, :full_address, :description, :avatar , :lat, :lng
json.ratings @place.ratings do |rating|
  json.id rating.id
  json.user_id rating.user_id
  json.privacy rating.privacy
  json.cleanliness rating.cleanliness
  json.comment rating.comment
  json.images rating.images do |image|
    json.image image.image.url
  end
  end
