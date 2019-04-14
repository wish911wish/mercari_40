FactoryBot.define do
  factory :big_category, class: Category do
    id  { 1 }
    name  { 'レディース' }
    parent  { 0 }
    initialize_with do
      Category.find_or_initialize_by(id: id,name: name,parent: parent)
    end
  end

  factory :middle_category, class: Category do
    id  { 2 }
    name  { 'トップス' }
    parent  { 1 }
    initialize_with do
      Category.find_or_initialize_by(id: id,name: name,parent: parent)
    end
  end

  factory :small_category, class: Category do
    id  { 3 }
    name  { 'ポロシャツ' }
    parent  { 2 }
    initialize_with do
      Category.find_or_initialize_by(id: id,name: name,parent: parent)
    end
  end

end
