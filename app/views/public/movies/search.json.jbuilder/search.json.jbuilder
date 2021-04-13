json.array! @movies do |movie|
  json.id movie.id
  json.title movie.title
  json.image_id movie.image_id
  json.director movie.director
  json.actor movie.actor
  json.user_sign_in current_customer
end
