# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookList, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:list) }
  end
end
