class RemoveAddressFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :address, :text
  end
end
