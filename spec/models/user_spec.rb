require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }
  it { should have_many(:topics) }

  it 'has a valid Factory' do
    expect(user).to be_valid
  end

end
