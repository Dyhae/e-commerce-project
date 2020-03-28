class CreateOrderproductlists < ActiveRecord::Migration[6.0]
  def change
    create_table :orderproductlists do |t|
      t.float :price
      t.integer :quantity
      t.references :oder, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
