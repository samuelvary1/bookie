class User < ActiveRecord::Base
  
  # has_secure_password

  has_one :account

  attr_accessible :id, :name, :email, :password, :password_confirmation, :avatar_url


  validates_uniqueness_of :email
end
