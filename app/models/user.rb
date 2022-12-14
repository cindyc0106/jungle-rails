class User < ActiveRecord::Base

  has_secure_password

  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true, length: {minimum: 5}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    user_email = email.strip.downcase
    user = User.find_by_email("#{user_email}")
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end

# ApplicationRecord