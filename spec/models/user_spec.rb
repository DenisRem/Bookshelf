# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    build(:user, last_name: 'Doe', first_name: 'John', role: 'customer')
  end

  it { is_expected.to be_valid }

  describe 'length is invalid' do
    it { is_expected.not_to allow_value('a' * 51).for(:first_name) }
    it { is_expected.not_to allow_value('a' * 51).for(:last_name) }
    it { is_expected.not_to allow_value('a' * 256).for(:email) }
  end

  describe 'length is valid' do
    it { is_expected.to allow_value('a' * 49).for(:last_name) }
    it { is_expected.to allow_value('a' * 49).for(:first_name) }
    it { is_expected.to allow_value("#{'a' * 245}@gmail.com").for(:email) }
  end
end
