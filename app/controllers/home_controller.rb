class HomeController < ApplicationController
  def index
  	@select_menu = "home"
  	pp "-----#{request}------"
  end

  def contact
  	@select_menu = "contact"
  end

end
