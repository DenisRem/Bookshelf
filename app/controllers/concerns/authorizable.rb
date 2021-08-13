# frozen_string_literal: true

module Authorizable
  extend ActiveSupport::Concern

  included do
    rescue_from Pundit::NotAuthorizedError, with: :authorization_error
    include Pundit

    def permitted_attributes
      variable_name = controller_name.classify.downcase
      record = instance_variable_get("@#{variable_name}")

      super(record || controller_name.classify.constantize, action_name)
    end
  end

  private

  def authorization_error
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to home_path
  end
end
