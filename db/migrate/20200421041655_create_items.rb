class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.srting :name, null: false
      t.text   :introduction, null: false
      t.integer :price, null: false
      t.string :item_condition, null: false
      t.string :shipping_area, null: false
      t.string :size, null: false
      t.datetime :preparation_day
      t.string :trading_status, null: false
      t.string :postage_type, null: false
      t.datetime :deal_closed_date
      t.integer :brand_id, foreign_key: true
      t.integer :buyer_id, null: false, foreign_key: true
      t.integer :seller_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
