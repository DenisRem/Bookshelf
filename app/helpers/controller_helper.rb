# frozen_string_literal: true

module ControllerHelper
  def successful_update(message)
    flash[:success] = message
  end
end
