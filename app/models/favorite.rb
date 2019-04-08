class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates_uniqueness_of :user_id,  uniquness: { scope: :item_id }
end
