class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates :email,
            :presence => true,
	    :uniqueness => true,
	    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.verify(email, user)
    if User.find_by_name(user) or User.find_by_email(email)
      user
    else
      nil
    end   
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end