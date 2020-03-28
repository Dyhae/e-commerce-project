# frozen_string_literal: true

class DropTableOrderproductlists < ActiveRecord::Migration[6.0]
  def change
    drop_table :orderproductlists
  end
end
