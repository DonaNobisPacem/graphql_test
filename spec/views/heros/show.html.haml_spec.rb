require 'rails_helper'

RSpec.describe "heros/show", type: :view do
  before(:each) do
    @hero = assign(:hero, Hero.create!(
      :name => "Name",
      :main_attr => "Main Attr",
      :skill1 => "Skill1",
      :skill2 => "Skill2",
      :skill3 => "Skill3",
      :skill4 => "Skill4",
      :str => 2,
      :agi => 3,
      :int => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Main Attr/)
    expect(rendered).to match(/Skill1/)
    expect(rendered).to match(/Skill2/)
    expect(rendered).to match(/Skill3/)
    expect(rendered).to match(/Skill4/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
