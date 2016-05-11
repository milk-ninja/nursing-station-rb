json.rating @rating, :id, :user_id, :place_id, :comment, :privacy, :cleanliness
json.images @rating.images do |image|
  json.image image.image
end
