class User < ActiveRecord::Base
  
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_length_of :password_confirmation, :minimum => 8

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip.downcase)
    @user && @user.authenticate(password) ? @user : nil
  end

end
