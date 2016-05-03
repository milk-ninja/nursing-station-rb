json.place @place, :name, :full_address, :description
json.ratings @place.ratings do |rating|
    json.user_id rating.user_id
    json.privacy rating.privacy
    json.cleanliness rating.cleanliness
    json.comment rating.comment
  end
