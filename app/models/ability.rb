class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :member
        can :manage, Viewel, :user_id => user.id

    end



 end
end
