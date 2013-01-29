class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new 
    can :read, :all
    can [:login, :create], User
    if user.github_username == 'SharpV'
        can :manage, :all
    end
  end
end
