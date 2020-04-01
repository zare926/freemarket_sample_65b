class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_family_name,                  null: false
      t.string :address_first_name,                   null: false
      t.string :address_family_name_kana,             null: false
      t.string :address_first_name_kana,              null: false
      t.string :postcode, null: false
      t.string :prefecture, null: false
      t.string :address_city, null: false
      t.string :address_block, null: false
      t.string :address_building
      t.string :phone_number
      t.references :user
      t.timestamps
    end
  end
end
