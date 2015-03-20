class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      can :read, :all
      can :create, :buy
      cannot :read, Notification
    else
      can :read, :all

      #Thing
      can :create, Thing
      can :update, Thing do |thing|
        (thing.user_id == user.id)
      end
      can :destroy, Thing do |thing|
        (thing.user_id == user.id)
      end
      can :crawler, Thing
      can :to_list, Thing

      #Feeling
      can :create, Feeling

      #Follower
      can :create, :follower
      can :destroy, :follower

      #kindeditor_upyun
      can :upload, :kindeditor_upyun

      #Like
      can :create, :like
      can :destroy, :like

      #Notification
      can :read, Notification
      can :destroy, Notification do |notification|
        (notification.user_id == user.id)
      end

      #Own
      can :create, :own
      can :destroy, :own

      #Photo
      can :create, Photo
      can :destroy, Photo do |photo|
        (photo.thing.blank? || photo.thing.user_id == user.id)
      end

      #Review
      can :create, Review
      can :update, Review do |review|
        (review.user_id == user.id)
      end
      can :destroy, Review do |review|
        (review.user_id == user.id)
      end

      #Setting
      can :profile, :setting
      can :save_profile, :setting
      can :drafts, :setting

      #Vote
      can :create, :vote
      can :destroy, :vote
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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
