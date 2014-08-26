class User < ActiveRecord::Base
  
  has_secure_password

  has_one :account
  has_many :assignments
  has_many :roles, :through => :assignments

  attr_accessible :id, :name, :email, :password, :password_confirmation, :bio

  validates_uniqueness_of :email

  def role_symbols
  	roles.map do |role|
  		role.name.underscore.to_sym
  	end
  end

end