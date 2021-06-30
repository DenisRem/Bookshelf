# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { build(:book, title: 'The Odd Sister', publishing_house: 'Opus Reader', language: 'English', year_of_publication: '2005', number_of_pages: '320', ISBN: '7256416783942') }

  it { is_expected.to be_valid }

  describe 'associations' do
    it { is_expected.to have_many(:book_authors) }
    it { is_expected.to have_many(:book_lists) }
    it { is_expected.to have_many(:authors).through(:book_authors) }
    it { is_expected.to have_many(:lists).through(:book_lists) }
  end

  describe 'validations' do
    describe 'length is invalid' do
      it { is_expected.not_to allow_value('a' * 51).for(:title) }
      it { is_expected.not_to allow_value('a' * 51).for(:publishing_house) }
      it { is_expected.not_to allow_value('a' * 21).for(:language) }
    end

    describe 'length is valid' do
      it { is_expected.to allow_value('a' * 49).for(:title) }
      it { is_expected.to allow_value('a' * 49).for(:publishing_house) }
      it { is_expected.to allow_value('a' * 19).for(:language) }
    end

    describe 'when numericality is valid' do
      it { is_expected.to allow_value('2021').for(:year_of_publication) }
      it { is_expected.to allow_value('368').for(:number_of_pages) }
      it { is_expected.to allow_value('6825438510').for(:ISBN) }
      it { is_expected.to allow_value('9263815739251').for(:ISBN) }
    end

    describe 'when numericality not valid' do
      it { is_expected.not_to allow_value('20021').for(:year_of_publication) }
      it { is_expected.not_to allow_value('10532').for(:number_of_pages) }
      it { is_expected.not_to allow_value('012345678').for(:ISBN) }
      it { is_expected.not_to allow_value('95632964ab').for(:ISBN) }
    end
  end
end
