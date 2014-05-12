class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :member
        can :manage, Viewel, :user_id => user.id    
    end

    if user.role? :following
       can :manage, Viewel, :user_id => user.id 
       can :read, Viewel, :private => false
    end

 end
end
