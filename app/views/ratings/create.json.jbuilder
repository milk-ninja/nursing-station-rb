json.rating @rating, :id, :user_id, :place_id, :comment, :privacy, :cleanliness
json.images @rating.images.first.image.url