# frozen_string_literal: true

class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def show; end
end
