class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new # represents a guest user

		if user.role? :admin
			can :manage, :all
		else
			can :read, :all
			can :create, Comment
			can :update, Comment do |comment|
				comment.try(:user) == user || user.role?(:moderator)
			end
		if user.role?(:moderator)
			can :create, Match
			can :update, Match do |match|
				match.try(:user) == user
				end
			end
		end
	end
end
