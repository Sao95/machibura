class Home < ApplicationRecord

  # 画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定、refile使用時のルール
  attachment :image

end
