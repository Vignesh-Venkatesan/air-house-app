class AccountsController < ApplicationController

  def signup
    @account = Account.new
  end

  def create
  	@account = Account.new(user_params)
    if @account.save
      sign_in @account
      flash[:success] = "User logged in successfully."

      # Delivers mail async to the new user
      AccountMailer.welcome_email(@account).deliver_later

      redirect_to home_path
    else
      flash[:error] = "User log in failed."
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