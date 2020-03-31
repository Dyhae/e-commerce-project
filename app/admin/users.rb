# frozen_string_literal: true

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :alias, :is_admin, :avatar
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Address' do
      f.input :email
      f.input :password
      f.input :alias
      f.inputs do
        f.input :avatar, as: :file
      end
      f.has_many :addresslists, allow_destroy: true do |n_f|
        n_f.input :address
      end
    end
    f.actions
  end

  # or
  #
  # permit_params do
  #   permitted = [:email, :password, :alias, :is_admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
