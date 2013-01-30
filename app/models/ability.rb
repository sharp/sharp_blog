class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new 
    can :read, :all
    can :create, User
    can [:login, :github], :all
    if user.github_username == 'SharpV'
        can :manage, :all
    end
  end
end
