# frozen_string_literal: true

class PropertyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    @user == @record.user || @user.user_type == 'property_manager'
  end

  def destroy?
    @user == @record.user
  end

  def index?
    @user.user_type == 'property_manager'
  end
end
