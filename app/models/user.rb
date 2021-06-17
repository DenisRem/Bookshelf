# frozen_string_literal: true

class User < ApplicationRecord
  enum role: {
    admin: ADMIN = 'admin',
    customer: CUSTOMER = 'customer'
  }

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true, length: { maximum: 255 }
end
