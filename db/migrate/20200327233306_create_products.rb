class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :model
      t.string :color
      t.string :transmission
      t.string :car_description
      t.string :car_option
      t.float :price
      t.float :sale_percentage
      t.integer :quantity_in_stock
      t.references :state, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
