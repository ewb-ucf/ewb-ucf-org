class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
       user ||= User.new # guest user (not logged in)
       
       #ACCESS PERMISSIONS IN ORDER OF SCOPE

       can :read, :all
       can :create, User

      if user.role == "admin"
        can :manage, :all
      else
        can :read, :all

        #MOVE OUTSIDE OF IF WHEN DONE TESTING
        #User can edit their own profile
        can :manage, User do |usr|
            usr.try(:user) == user
          end

        #User can manage their own blogs
        can :manage, Blog do |blog|
            blog.try(:user_id) == user.id
          end

        #Team managers can manage their team's projects
        #can :manage, Project do |project|
        #    project.try(:user_id) == user.id
        #  end

        cannot :index, User
      end
     

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