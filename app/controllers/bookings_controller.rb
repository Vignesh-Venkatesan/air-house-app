class BookingsController < ApplicationController

  def confirm
  	@house = House.find_by(regid: params[:format])
  	@account = current_account

  	@booking = Booking.new
  end

  def create
  
  end

  def show
    
  end

  def booklist
    @bookings = Booking.where("email = ?", current_account.email).to_a
    print @bookings
  end

end