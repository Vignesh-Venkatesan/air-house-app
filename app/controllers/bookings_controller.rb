class BookingsController < ApplicationController

  def create
    if !(current_account.nil?)
  	  @house = House.find_by(regid: params[:format])
  	  @account = current_account
  	  @booking = Booking.create(regid: @house.regid, email: @account.email, guests: @house.guests, cost: @house.cost)
    else
      print 'Login to proceed'
      flash[:error] = "Please Log-in/Sign-up for Booking Buddy!"
      redirect_to login_path
    end
  end

  def destroy
    print 'destroy called in bookings'
    Booking.delete(params[:id])
    flash[:success] = "Booking was cancelled succesfully."
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