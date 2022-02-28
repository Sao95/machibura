class Post < ApplicationRecord

  # 画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定、refile使用時のルール
  attachment :image

  # optional: true → nilを許可
  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :image, presence: true
  validates :prefecture, presence: true
  validates :place, presence: true
  validates :writings, presence: true, length: {maximum: 500 }

  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def create_tags
    # 投稿した画像をAPI側に渡す
    tag_names = Vision.get_image_data(image)
    # API側から返ってきた値をもとにタグを作成する
    tag_names.each { |tag_name| tags.create(name: tag_name) }
  end

  # addressにprefecture,spot_nameカラムを代入
  def address
    [self.prefecture_i18n, self.place].compact.join()
  end
  # 送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  geocoded_by :address
  after_validation :geocode, if: :prefecture||:place_changed?

  # 都道府県
  enum prefecture: {
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
  }
  
  def self.most_favorite(n = 10)
    where(id: Favorite.group(:post_id).order('count(post_id) desc').limit(n).pluck(:post_id))
  end

  # ransacker :favorites_count do
  # end

end
