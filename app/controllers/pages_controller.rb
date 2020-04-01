# frozen_string_literal: true

class PagesController < InheritedResources::Base
  http_basic_authenticate_with name: 'admin', password: 'admin', except: %i[index show]

  # private

  def page_params
    params.require(:page).permit(:title, :content, :permalink)
  end

  def permalink
    @page = Page.find_by(permalink: params[:permalink])

    redirect_to root_path if @page.nil?
  end
end
