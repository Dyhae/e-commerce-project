# frozen_string_literal: true

class ChangeNotNullToNullOrderproductlist < ActiveRecord::Migration[6.0]
  def change
    change_column_null :orderproductlists, :product_id, true
    change_column_null :orderproductlists, :order_id, true
  end
end
