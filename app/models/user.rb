class User < ActiveRecord::Base
  acts_as_authentic
  has_secure_password
  has_many :comments

  attr_accessible :id, :name, :email, :password, :password_confirmation, :bio, :roles_mask, :roles, :account, :persistence_token

  validates_uniqueness_of :email

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }

  ROLES = %w[admin moderator player]

  # admin can do anything
  # moderator can create matches
  # player can bet, comment, look at match results
  # player can also edit their OWN profile

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role?(role)
    roles.include? role.to_s
  end

end