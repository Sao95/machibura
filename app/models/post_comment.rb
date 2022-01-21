class PostComment < ApplicationRecord
  
  # optional: true → nilを許可
  belongs_to :user, optional: true
  belongs_to :post
  
  validates :comment, presence: true, length: {maximum: 200 }

end
