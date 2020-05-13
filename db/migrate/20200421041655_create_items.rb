class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text   :introduction, null: false
      t.integer :price, null: false
      t.string :item_condition, null: false
      t.string :shipping_area, null: false
      t.string :size
      t.string :preparation_day, null: false
      t.string :trading_status, null: false
      t.string :postage_type
      t.datetime :deal_closed_date
      t.integer :brand_id, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.integer :seller_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.timestamps
    end
  end
end
