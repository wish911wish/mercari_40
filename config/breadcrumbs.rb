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

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

crumb :card do
  link "支払い方法", card_index_path
  parent :mypage
end

crumb :card_new do
  link "クレジットカード情報入力", new_card_path
  parent :card
end