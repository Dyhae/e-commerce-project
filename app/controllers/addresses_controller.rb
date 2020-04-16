# frozen_string_literal: true

class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses
  end

  def show
    @address = Address.find(params[:id])
  end

  def destroy
    @destroyAddress = Address.find(params[:id])
    @addressList_Destroy = Addresslist.find_by(address_id: @destroyAddress.id)
    @addressList_Destroy.destroy
    @destroyAddress.destroy
    redirect_to addresses_path
  end

  def edit
    @addressEdit = Address.find(params[:id])
  end

  def update
    @addressUpdate = Address.find(params[:id])
    @addressUpdate.update!(address_params)
    redirect_to addresses_path
  end

  def create
    # street_no = params[:street_no]
    # city = params[:city]
    # postal_code = params[:postal_code]
    @current = current_user.id
    # province_id = params[:province_id]
    query = { street_no: params[:create_addresses][:street_no],
              apt_no: params[:create_addresses][:apt_no],
              postal_code: params[:create_addresses][:postal_code],
              city: params[:create_addresses][:city],
              province_id: params[:create_addresses][:province_id] }
    @create_address = Address.find_or_create_by(query)
    @create_address.save
    address_query = { user_id: @current, address_id: @create_address.id }
    @addresslist = Addresslist.find_or_create_by(address_query)
    @addresslist.save

    redirect_to root_path
  end

  private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def address_params
    params.require(:update_address).permit(:street_no, :apt_no, :abbr, :postal_code, :city, :province_id)
  end
end
