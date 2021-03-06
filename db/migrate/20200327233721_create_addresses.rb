class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_no
      t.string :apt_no
      t.string :postal_code
      t.string :city
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
