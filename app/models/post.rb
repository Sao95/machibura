class Post < ApplicationRecord

  # 画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定、refile使用時のルール
  attachment :image
  
  # optional: true → nilを許可
  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :address, presence: true
  validates :writings, presence: true, length: {maximum: 500 }

  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # ransacker :favorites_count do
  # end

end
