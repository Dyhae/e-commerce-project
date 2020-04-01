class ApplicationController < ActionController::Base
  def application
    @application_category = Category.all
  end

  def show_category

    @category = Category.find_by(params[:id])

  end
end
