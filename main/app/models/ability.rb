class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
       user ||= User.new # guest user (not logged in)
       
       #ACCESS PERMISSIONS IN ORDER OF SCOPE

       #Admin have access to everything
        if user.role == "admin"
          can :manage, :all
        else
          can :read, :all
        end

        #Eboard can manage projects, events, media
        if user.role == "eboard"
          can :manage, Project
          can :manage, Event
          #can :manage, Media
        else
          can :read, Project
          can :read, Event
          #can :read, Media
        end

        #Members can manage thier user own profile page
        if user.role == "member"
          can :manage, User do |usr|
            usr.try(:user) == user
          end
        else
          can :read, :all
        end

          #Users can read projects, events, media
          #if user.role == "user"
          #  can :read, :all
          #end

    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end