# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { build(:author) }

  it { is_expected.to be_valid }

  describe 'associations' do
    it { is_expected.to have_many(:book_authors) }
    it { is_expected.to have_many(:books).through(:book_authors) }
  end

  describe 'validations' do
    describe 'length is valid' do
      it { is_expected.to validate_length_of(:name).is_at_most(50) }
    end
  end
end
