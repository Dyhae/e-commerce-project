# frozen_string_literal: true

ActiveAdmin.register Address do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :street_no, :apt_no, :postal_code, :city, :province_id, addresslists_attributes: %i[id address_id user_id _destroy]
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Address' do
      f.input :street_no
      f.input :apt_no
      f.input :postal_code
      f.input :city
      f.input :province
      f.has_many :addresslists, allow_destroy: true do |n_f|
        n_f.input :user
      end
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:street_no, :apt_no, :postal_code, :city, :province_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
