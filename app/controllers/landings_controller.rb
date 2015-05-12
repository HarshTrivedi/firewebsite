class LandingsController < ApplicationController
  def index
  end


  def fire
  	permalink = params[:permalink]
  	@homelink = HomeLink.find_by_path(permalink)  	
  	@tabs = @homelink.tabs
  	ap "permalink : #{permalink}"
  	ap "homelink  : #{@homelink}"
  	ap "tabs      : #{@tabs}"
  end


end
