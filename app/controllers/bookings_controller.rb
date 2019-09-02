class BookingsController < ApplicationController

  def confirm
    if !(current_account.nil?)
  	  @house = House.find_by(regid: params[:format])
  	  @account = current_account
  	  @booking = Booking.create(regid: @house.regid, email: @account.email, guests: @house.guests, cost: @house.cost)
    else
      print 'Login to proceed'
      redirect_to login_path
    end
  end

  def create
  end

  def destroy
    print 'destroy called in bookings'
    Booking.delete(params[:id])
    redirect_to home_path
  end

  def show
    print params[:id]
    @booking = Booking.find(params[:id])
  end

  def booklist
    @bookings = Booking.where("email = ?", current_account.email).to_a
    print @bookings
  end

end