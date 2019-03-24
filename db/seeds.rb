require 'csv'

csv_data = CSV.read('db/brands.csv', headers: true)
csv_data.each do |data|
  Brand.create!(data.to_hash)
end

csv_data = CSV.read('db/categories.csv', headers: true)
csv_data.each do |data|
  Category.create!(data.to_hash)
end

csv_data = CSV.read('db/conditions.csv', headers: true)
csv_data.each do |data|
  Condition.create!(data.to_hash)
end

csv_data = CSV.read('db/days_for_shipments.csv', headers: true)
csv_data.each do |data|
  DaysForShipment.create!(data.to_hash)
end

csv_data = CSV.read('db/shipping_costs.csv', headers: true)
csv_data.each do |data|
  ShippingCost.create!(data.to_hash)
end

csv_data = CSV.read('db/shipping_methods.csv', headers: true)
csv_data.each do |data|
  ShippingMethod.create!(data.to_hash)
end

csv_data = CSV.read('db/sizes.csv', headers: true)
csv_data.each do |data|
  Size.create!(data.to_hash)
end

csv_data = CSV.read('db/statuses.csv', headers: true)
csv_data.each do |data|
  Statuse.create!(data.to_hash)
end

csv_data = CSV.read('db/category_sizes.csv', headers: true)
csv_data.each do |data|
  CategorySize.create!(data.to_hash)
end
