class CreateOrderproductlists < ActiveRecord::Migration[6.0]
  def change
    create_table :orderproductlists do |t|
      t.string :rails
      t.string :g
      t.string :model
      t.string :orderproductlist
      t.float :price
      t.integer :quantity
      t.references :oder, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
