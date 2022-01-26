class Contact < ApplicationRecord
  enum subject: { users: 0, posts: 1, post_comments: 3, others: 4 }
end
