class AddColumnsToPosts2 < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :prefecture, :integer
    add_column :posts, :place, :string
  end
end
