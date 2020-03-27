class CreateAddresslists < ActiveRecord::Migration[6.0]
  def change
    create_table :addresslists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
