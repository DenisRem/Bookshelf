# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator do
  subject { build(:user, last_name: 'Doe', first_name: 'John', role: 'customer') }

  it { is_expected.to be_valid }
end
