require 'csv'

csv_data = CSV.read('db/items.csv', headers: true)
csv_data.each do |data|
  Item.create!(data.to_hash)
end

csv_data = CSV.read('db/item_images.csv', headers: true)
csv_data.each do |data|
  ItemImage.create(data.to_hash)
end
