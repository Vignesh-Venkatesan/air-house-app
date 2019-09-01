class AccountsController < ApplicationController

  def signup
    @account = Account.new
  end

  def create
  	@account = Account.new(user_params)
    if @account.save
      sign_in @account
      redirect_to home_path
    else
      redirect_to login_path 
    end
  end

  def show
    @acc = Account.find_by(email: params[:id] + '.com')
  end

  private

  def user_params
    params.require(:account).permit(:name, :email, :password_digest, :ph_no)
  end

end