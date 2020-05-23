class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text   :introduction, null: false
      t.integer :price, null: false
      t.string :item_condition_id, null: false
      t.string :shipping_area_id, null: false
      t.string :size
      t.string :preparation_day_id, null: false
      t.string :trading_status_id, null: false
      t.string :postage_type_id
      t.datetime :deal_closed_date
      t.integer :brand_id, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.integer :seller_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.timestamps
    end
  end
end
