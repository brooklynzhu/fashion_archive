class Ability
  include CanCan::Ability

  def initialize(user)

    if user == Admin_user
        can :manage, :all
    end

    if user == Collection_manager
        can :create, Client
        can :update, Client do |client|
            client.try(:user) == user
        end
    end
  end
end
