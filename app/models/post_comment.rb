class PostComment < ApplicationRecord
  
  # optional: true → nilを許可
  belongs_to :user, optional: true
  belongs_to :post
  
end
