json.array! @movies do |movie|
  json.image_id movie.image_id
  json.title movie.title
  json.actor movie.actor
end