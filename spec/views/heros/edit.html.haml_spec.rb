require 'rails_helper'

RSpec.describe "heros/edit", type: :view do
  before(:each) do
    @hero = assign(:hero, Hero.create!(
      :name => "MyString",
      :main_attr => "MyString",
      :skill1 => "MyString",
      :skill2 => "MyString",
      :skill3 => "MyString",
      :skill4 => "MyString",
      :str => 1,
      :agi => 1,
      :int => 1
    ))
  end

  it "renders the edit hero form" do
    render

    assert_select "form[action=?][method=?]", hero_path(@hero), "post" do

      assert_select "input#hero_name[name=?]", "hero[name]"

      assert_select "input#hero_main_attr[name=?]", "hero[main_attr]"

      assert_select "input#hero_skill1[name=?]", "hero[skill1]"

      assert_select "input#hero_skill2[name=?]", "hero[skill2]"

      assert_select "input#hero_skill3[name=?]", "hero[skill3]"

      assert_select "input#hero_skill4[name=?]", "hero[skill4]"

      assert_select "input#hero_str[name=?]", "hero[str]"

      assert_select "input#hero_agi[name=?]", "hero[agi]"

      assert_select "input#hero_int[name=?]", "hero[int]"
    end
  end
end
