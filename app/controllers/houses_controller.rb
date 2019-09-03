class HousesController < ApplicationController

  def create
  	@house = House.new(user_params)
  	if @house.save
      flash[:success] = "Hosting house was successful."
      redirect_to home_path
    else
      flash[:error] = "Hosting house got failed."
      redirect_to houses_host_path
    end
  end

  def new
    @house = House.new
    @account = current_account
  end

  def search
    @city = params[:house][:city]    
    @loc = params[:house][:locality]
    @ht = params[:house][:housetype]

    (@ht == 'Any') ? (@ht = '') : (print @ht.to_s)

    if @loc.present? and @ht.present?
      @houses = House.where("city = ? and locality = ? and housetype = ?", @city, @loc, @ht).to_a
    elsif @ht.present?
      @houses = House.where("city = ? and housetype = ?", @city, @ht).to_a
    elsif @loc.present?
      @houses = House.where("city = ? and locality = ?", @city, @loc).to_a
    else
      @houses = House.where("city = ?", @city).to_a
    end

    print @houses.to_s
  end

  def edit
    print params[:id]
    @house = House.find(params[:id])
  end

  def update
    print params[:id]
    @h = House.find(params[:id])

    @h.update_attributes(house_param)
    flash[:success] = "House was updated successful."
    redirect_to houses_hostlist_path
  end

  def destroy
    print 'destroy called in houses'
    House.delete(params[:id])
    flash[:success] = "House was deleted successful."
    redirect_to home_path
  end

  def show
    print params[:id]
    @house = House.find(params[:id])
  end

  def hostlist
    @houses = House.where("email = ?", current_account.email).to_a
    print @houses
  end

  def house_param
    params.require(:house).permit(:regid, :city, :locality, :address, :housetype, :guests, :cost)
  end

  def user_params
    params.require(:house).permit(:email, :regid, :city, :locality, :address, :housetype, :guests, :cost)
  end

end