require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :periodo
  attr_protected :id, :salt
  attr_accessor :password, :password_confirmation
  CLIENT = 1
  ADMIN = 2
  
  validates_length_of :login, :within => 3..40
  validates_length_of :password, :within => 5..40, :allow_blank=>true
  validates_presence_of :login, :email, :salt, :role
  validates_presence_of :password, :password_confirmation, :on=>:create
  validates_uniqueness_of :login, :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  
  def password=(password)
    @password = password
    self.salt = User.random_string(10) if !self.salt?
    self.hashed_password = User.encrypt(@password, self.salt)
  end
   
  def self.authenticate(login, password)
    user = find_by_login login
    user.nil? ? nil : (self.encrypt(password, user.salt) != user.hashed_password) ? nil : user
  end
    
  def send_new_password
    new_password = User.random_string(10)
    update_attributes({:password=>new_password, :password_confirmation=>new_password})
    Notifications.deliver_forgot_password(email, login, new_password)
  end
    
  protected
    
  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end
    
  def self.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    newpass
  end
end
