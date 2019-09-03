class Account < ActiveRecord::Base

  before_create :create_remember_token
  
  def Account.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Account.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.from_omniauth(auth)
    # Creates a new account only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |account|
      account.name = auth.info.name
      account.email = auth.info.email
    end
  end

  private

    def create_remember_token
      self.remember_token = Account.digest(Account.new_remember_token)
    end

  	has_secure_password
end