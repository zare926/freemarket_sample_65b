class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postcode, null: false
      t.integer :user
      t.timestamps
    end
  end
end
