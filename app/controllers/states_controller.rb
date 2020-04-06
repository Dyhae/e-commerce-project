# frozen_string_literal: true

class StatesController < ApplicationController

  def index
    # @stateUpdate = State.find_by(name: 'recently updated').products
  end

  def show; end

  def getState
    @stateNew = if params[:name] == 'On Sale'
                  State.find_by(name: params[:name]).products
                elsif params[:name] == 'New'
                  State.find_by(name: params[:name]).products
                       .where('created_at > ?', Time.now - 3.day)
                elsif params[:name] == 'recently updated'
                  State.find_by(name: params[:name]).products
                       .where('updated_at > ?', Time.now - 3.day)
                end
  end
end
