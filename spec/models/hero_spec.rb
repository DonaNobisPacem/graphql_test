require 'rails_helper'

RSpec.describe Hero, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:hero)).to be_valid
  end
end
