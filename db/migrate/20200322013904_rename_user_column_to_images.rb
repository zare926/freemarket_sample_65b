class RenameUserColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :user, :user_id
  end
end
