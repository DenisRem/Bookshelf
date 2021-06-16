# frozen_string_literal: true

class User < ApplicationRecord
  ADMIN = 'admin'
  CUSTOMER = 'customer'

  ROLES = [ADMIN, CUSTOMER].freeze

  enum role: ROLES

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true, length: { maximum: 255 }
end
