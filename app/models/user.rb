class User < ApplicationRecord
  
  # is_deletedがfalseの時に認証する
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, presence: true, length: {maximum: 20 }
  
end
