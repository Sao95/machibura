class AddIsDeletedToUsers < ActiveRecord::Migration[5.2]
  def change
    # boolean → 真（true）か偽（false）のどちらかの値が入る
    add_column :users, :is_deleted, :boolean, default: false
  end
end
