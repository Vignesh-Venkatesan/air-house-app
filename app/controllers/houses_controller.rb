class HousesController < ApplicationController

  def create
  	@house = House.new(user_params)
  	if @house.save
      redirect_to home_path
    else
      redirect_to houses_host_path
    end
  end

  def new
    @house = House.new
    @account = current_account
  end

  def search
    @houses = House.where("city = ? and locality = ? and housetype = ?", params[:house][:city], params[:house][:locality], params[:house][:housetype]).to_a
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
    redirect_to houses_hostlist_path
  end

  def destroy
    print 'destroy called in houses'
    House.delete(params[:id])
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