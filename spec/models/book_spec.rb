# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { build(:book) }

  it { is_expected.to be_valid }

  describe 'associations' do
    it { is_expected.to have_many(:book_authors) }
    it { is_expected.to have_many(:authors).through(:book_authors) }
  end

  describe 'validations' do
    describe 'length is valid' do
      it { is_expected.to validate_length_of(:title).is_at_most(50) }
      it { is_expected.to validate_length_of(:publishing_house).is_at_most(50) }
      it { is_expected.to validate_length_of(:language).is_at_most(20) }
    end

    describe 'when numericality is valid' do
      it { is_expected.to validate_numericality_of(:number_of_pages).allow_nil }
      it { is_expected.to validate_numericality_of(:ISBN).allow_nil }
      it { is_expected.to validate_numericality_of(:year_of_publication) }
    end
  end
end
