json.places @places do |place|
  json.id place.id
  json.name place.name
  json.full_address place.full_address
end
