class User < ActiveRecord::Base
  attr_accessible :username, :password
  before_validation :reset_session_token
  validates :username, :password_digest, :session_token, :presence => true

  has_many :goals
  has_many :cheers

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if user && user.is_password?(password)
    nil
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
  end

  def reset_session_token
    self.session_token = generate_session_token
  end

  def reset_session_token!
    reset_session_token
    self.save!
  end

end
