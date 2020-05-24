class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text   :introduction, null: false
      t.integer :price, null: false
      t.integer :item_condition, null: false
      t.integer :shipping_area, null: false
      t.string :size
      t.integer :preparation_day, null: false
      t.integer :trading_status, null: false
      t.integer :postage_type
      t.datetime :deal_closed_date
      t.integer :brand_id, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.integer :seller_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.integer :user_id
      t.timestamps
    end
  end
end
