class CreateBuyerForms < ActiveRecord::Migration[7.0]
  def change
    create_table :buyer_forms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :buyers ,null: false, foreign_key: true
      t.string :post_code ,null: false
      t.integer :prefecture_id ,null: false
      t.string :address , null: false
      t.string :city , null: false
      t.string :building 
      t.string :telephone_number , null: false
      t.timestamps
    end
  end
end
