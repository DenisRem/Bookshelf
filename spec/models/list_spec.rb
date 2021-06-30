# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  subject { build(:list, name: 'favorite') }

  it { is_expected.to be_valid }

  describe 'associations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:book_lists) }
    it { is_expected.to have_many(:books).through(:book_lists) }
  end

  describe 'validations' do
    describe 'length is invalid' do
      it { is_expected.not_to allow_value('a' * 51).for(:name) }
    end

    describe 'length is valid' do
      it { is_expected.to allow_value('a' * 49).for(:name) }
    end
  end
end
