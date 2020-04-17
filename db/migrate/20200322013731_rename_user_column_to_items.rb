class RenameUserColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :user, :user_id
  end
end
