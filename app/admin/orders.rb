# frozen_string_literal: true

ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :order_number, :subtotal, :GST, :PST, :HST, :total, :status_id, :user_id, orderproductlists_attributes: %i[id order_id product_id _destroy]
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Orders' do
      f.input :order_number
      f.input :subtotal
      f.input :GST
      f.input :PST
      f.input :HST
      f.input :total
      f.input :status
      f.input :user
      f.has_many :orderproductlists, allow_destroy: true do |n_f|
        n_f.input :product
      end
    end
    f.actions
  end
end
