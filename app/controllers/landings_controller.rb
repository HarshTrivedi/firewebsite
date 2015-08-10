class LandingsController < ApplicationController
  def index
    current_year = Year.where(:current => true).last || Year.last
    home_link = current_year.home_links.first
    redirect_to fire_page_path(home_link.path)
  end


  def fire
  	permalink = params[:permalink]
  	@homelink = HomeLink.find_by_path(permalink)  	

    if @homelink.nil?
      current_year = Year.where(:current => true).last || Year.last
      @homelink = current_year.home_links.first
      redirect_to fire_page_path(@homelink.path)
    end

  	@tabs = @homelink.tabs
  	ap "permalink : #{permalink}"
  	ap "homelink  : #{@homelink}"
  	ap "tabs      : #{@tabs}"
  end


end
