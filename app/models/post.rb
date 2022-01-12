class Post < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  
  # 画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定、refile使用時のルール
  attachment :image
end
