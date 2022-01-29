class RemoveColumnsInPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :place, :string
    remove_column :posts, :station, :string
  end
end
