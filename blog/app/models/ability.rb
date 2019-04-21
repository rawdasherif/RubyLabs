# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    # alias_action :create, :update, :destroy, to: :crud
    if user
      can :manage, Comment
      can :destroy,  Article, user_id: user.id 
      can :edit,  Article, user_id: user.id 
      can :update,  Article, user_id: user.id 
    end
  end
end
