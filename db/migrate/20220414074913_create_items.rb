class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.text :introduction
      t.integer :price
      t.integer :condition_id
      t.integer :shipment_id
      t.integer :category_id
      t.integer :prefecture_id
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
