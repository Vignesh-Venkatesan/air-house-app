class AccountMailer < ApplicationMailer

	default from: 'vickeycrack@gmail.com'
 
	def welcome_email (recepient)
	    @url  = 'http://localhost:3000/login'
	    @account = recepient
	    puts @account
	    mail(to: @account.email, subject: 'Welcome to Air-House Site')
	end

end