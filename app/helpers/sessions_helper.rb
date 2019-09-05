module SessionsHelper

	def sign_in(account)
    remember_token = Account.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    account.update_attribute(:remember_token, Account.digest(remember_token))
    self.current_account = account
  end

	def signed_in?
  	!current_account.nil?
	end

	def current_account=(account)
  	@current_account = account
	end

	def current_account
  	remember_token = Account.digest(cookies[:remember_token])
  	@current_account ||= Account.find_by(remember_token: remember_token)
	end

	def sign_out
  	current_account.update_attribute(:remember_token, Account.digest(Account.new_remember_token))
  	cookies.delete(:remember_token)
  	self.current_account = nil
	end

end