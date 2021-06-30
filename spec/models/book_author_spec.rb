# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book).optional }
    it { is_expected.to belong_to(:author).optional }
  end
end
