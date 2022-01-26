class Contact < ApplicationRecord
  
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true

  enum subject: { users: 0, posts: 1, post_comments: 3, others: 4 }
  
end
