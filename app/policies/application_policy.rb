# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless current_user

    @current_user = current_user
    @model = model
  end

  protected

  def destroy?
    raise NotImplementedError, 'define method :destroy?'
  end

  private

  def user_admin?
    @current_user.admin?
  end
end
