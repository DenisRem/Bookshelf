# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user_admin?
  end

  def show?
    user_admin?
  end

  def update?
    user_admin? || current_user.id == model.id
  end

  def edit?
    user_admin? || current_user.id == model.id
  end

  def destroy?
    user_admin?
  end

  def permitted_attributes
    if user_admin?
      general_attributes.push(:role, :password)
    else
      general_attributes
    end
  end

  private

  def general_attributes
    %i[first_name last_name email avatar]
  end
end
