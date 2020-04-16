class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.integer :status, default: 0
      t.text :description, null: false
      t.string :brand
      t.integer :state, null: false
      t.integer :postage, null: false
      t.string :prefecture, null: false
      t.integer :shipping_date, null: false
      t.integer :price, null: false
      t.string :size
      t.integer :user_id, null: false
      t.integer :category_id
      t.timestamps
    end
  end
end
