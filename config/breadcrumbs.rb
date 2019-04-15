crumb :root do
  link 'メルカリ', root_path
end

crumb :items do
  link "アイテム", items_path
  parent :root
end

crumb :item_name do |item|
  link item.name
  parent :items
end

