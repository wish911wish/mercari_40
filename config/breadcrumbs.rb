crumb :root do
  link 'メルカリ', root_path
end

crumb :items do
  link "アイテム", items_path
  parent :root
end

crumb :item_name do
  link "HHKB Professional 2 英語配列 墨 静電容量無接点", items_path
  parent :items
end

