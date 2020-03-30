# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :model, :color, :transmission, :car_description, :car_option, :price, :sale_percentage, :quantity_in_stock, :state_id, :category_id
end
