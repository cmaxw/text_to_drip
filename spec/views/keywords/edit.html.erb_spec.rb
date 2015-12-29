require 'rails_helper'

RSpec.describe "keywords/edit", type: :view do
  before(:each) do
    @keyword = assign(:keyword, Keyword.create!(
      :keyword => "MyString",
      :list_name => "MyString"
    ))
  end

  it "renders the edit keyword form" do
    render

    assert_select "form[action=?][method=?]", keyword_path(@keyword), "post" do

      assert_select "input#keyword_keyword[name=?]", "keyword[keyword]"

      assert_select "input#keyword_list_name[name=?]", "keyword[list_name]"
    end
  end
end
