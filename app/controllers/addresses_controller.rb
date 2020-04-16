# frozen_string_literal: true

class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses
  end

  def show
    # @Useraddresses = current_user.addresses
  end

  def userAddresses
    @userAddresses = current_user.addresses
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
end
