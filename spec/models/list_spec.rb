# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:book_lists) }
    it { is_expected.to have_many(:books).through(:book_lists) }
  end
end
