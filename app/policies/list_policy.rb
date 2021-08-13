# frozen_string_literal: true

class ListPolicy < ApplicationPolicy
  def index?
    user_admin?
  end

  def new?
    user_admin? || current_user.id == model.id
  end

  def create?
    user_admin? || current_user.id == model.id
  end

  def show?
    user_admin?
  end

  def update?
    user_admin?
  end

  def edit?
    user_admin?
  end

  def destroy?
    user_admin?
  end

  def permitted_attributes
    general_attributes
  end

  private

  def general_attributes
    %i[name user_id book_ids]
  end
end
