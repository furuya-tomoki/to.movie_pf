json.array! @movies do |movie|
  json.title movie.title
  json.actor movie.actor
end