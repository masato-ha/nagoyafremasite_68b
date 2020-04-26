class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :card_number, null: false
      t.integer :expriation_year, null: false
      t.integer :expriation_month, null: false
      t.integer :seculity_code, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
