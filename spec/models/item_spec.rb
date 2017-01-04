require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:item)).to be_valid
  end
end
