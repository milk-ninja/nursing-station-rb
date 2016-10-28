json.places @places do |place|
  json.id place.id
  json.name place.name
  json.full_address place.full_address
  json.lat place.lat
  json.lng place.lng
  json.avatar_url place.avatar.url
  json.privacy place.avg_privacy
  json.cleanliness place.avg_cleanliness
end
