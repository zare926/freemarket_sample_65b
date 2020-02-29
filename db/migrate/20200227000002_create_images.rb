class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :user, null: false
      t.integer :item, null: false
      t.timestamps
    end
  end
end
