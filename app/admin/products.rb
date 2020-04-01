# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :model, :color, :transmission, :car_description, :car_option, :price, :sale_percentage, :quantity_in_stock, :state_id, :category_id, :image
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Orders' do
      f.input :model
      f.input :color
      f.input :transmission
      f.input :car_description
      f.input :car_option
      f.input :price
      f.input :sale_percentage
      f.input :quantity_in_stock
      f.input :category
      f.input :state
      f.inputs do
        f.input :image, as: :file
      end
      f.has_many :orderproductlists, allow_destroy: true do |n_f|
        n_f.input :order
      end
    end
    f.actions
  end
end
