json.array! @products do |product|
  json.(product, :id, :name, :price, :timestamps)
end