require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }

  it 'has a valid Factory' do
    expect(user).to be_valid
  end

  it 'sends a confirmation email' do
    expect(Devise.mailer.deliveries.count).to eq 1
  end
end
