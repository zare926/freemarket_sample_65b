class CreateBuyItems < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_items do |t|
      t.date :buy_date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false
      t.references :creditCard, null: false
      t.timestamps
    end
  end
end
