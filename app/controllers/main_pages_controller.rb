class MainPagesController < ApplicationController

  def home
  	@house = House.new
  end

end