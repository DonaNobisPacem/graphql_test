require 'rails_helper'

RSpec.describe Itemization, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:itemization)).to be_valid
  end
end
