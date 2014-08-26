class User < ActiveRecord::Base
  
  has_secure_password

  has_one :account

  has_and_belongs_to_many :roles

  attr_accessible :id, :name, :email, :password, :password_confirmation, :bio

  validates_uniqueness_of :email

end