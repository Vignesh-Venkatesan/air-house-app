class Account < ActiveRecord::Base

  before_create :create_remember_token
  
  def Account.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Account.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Account.digest(Account.new_remember_token)
    end

  	has_secure_password
end