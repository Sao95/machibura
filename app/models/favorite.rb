class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  # post_idにuser_idが重複していないこと
  validates_uniqueness_of :post_id, scope: :user_id
end
