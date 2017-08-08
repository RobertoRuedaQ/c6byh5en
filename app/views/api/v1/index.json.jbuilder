json.array! @products do |user|
  json.(user, :id, :name, :price, :timestamps)
end