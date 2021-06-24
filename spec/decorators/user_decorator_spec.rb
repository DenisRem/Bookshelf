# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator do
  subject { user.decorate }

  let(:user) { build(:user) }

  it '#full_name' do
    expect(subject.full_name).to eq("#{user.first_name} #{user.last_name}")
  end
end
