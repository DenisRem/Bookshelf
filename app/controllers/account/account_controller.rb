# frozen_string_literal: true

module Account
  class AccountController < ApplicationController
    include Pundit
    before_action :authenticate_user!
  end
end
