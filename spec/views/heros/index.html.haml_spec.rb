require 'rails_helper'

RSpec.describe "heros/index", type: :view do
  before(:each) do
    assign(:heros, [
      Hero.create!(
        :name => "Name",
        :main_attr => "Main Attr",
        :skill1 => "Skill1",
        :skill2 => "Skill2",
        :skill3 => "Skill3",
        :skill4 => "Skill4",
        :str => 2,
        :agi => 3,
        :int => 4
      ),
      Hero.create!(
        :name => "Name",
        :main_attr => "Main Attr",
        :skill1 => "Skill1",
        :skill2 => "Skill2",
        :skill3 => "Skill3",
        :skill4 => "Skill4",
        :str => 2,
        :agi => 3,
        :int => 4
      )
    ])
  end

  it "renders a list of heros" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Main Attr".to_s, :count => 2
    assert_select "tr>td", :text => "Skill1".to_s, :count => 2
    assert_select "tr>td", :text => "Skill2".to_s, :count => 2
    assert_select "tr>td", :text => "Skill3".to_s, :count => 2
    assert_select "tr>td", :text => "Skill4".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
