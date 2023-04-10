# frozen_string_literal: true

class LeasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.user_type == 'property_manager' || user.user_type == 'receptionist'
        scope.all # Managers and admins can see all records
      else
        scope.where(user_id: user.id) # Juniors can only see their own records
      end
    end
  end

  def update?
    @user.user_type == 'property_manager'
  end

  def destroy?
    @user.user_type == 'property_manager'
  end

  def create?
    @user.user_type == 'property_manager'
  end

  def show?
    @user.user_type == 'property_manager' || @user == @record.user
  end

  def index?
    true
  end
end
