FactoryBot.define do
  factory :detail_search_params do
    sort_order            {}
    keyword               {}
    big_category_id       {}
    small_category_id     {}
    brand_name            {}
    size_group            {}
    size_id               {}
    price                 {}
    price_min             {}
    price_max             {}
    condition_id          {}
    shipping_cost_id      {}
    status_id             {}
  end
end
