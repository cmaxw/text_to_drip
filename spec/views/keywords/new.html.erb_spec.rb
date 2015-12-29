require 'rails_helper'

RSpec.describe "keywords/new", type: :view do
  before(:each) do
    assign(:keyword, Keyword.new(
      :keyword => "MyString",
      :list_name => "MyString"
    ))
  end

  it "renders new keyword form" do
    render

    assert_select "form[action=?][method=?]", keywords_path, "post" do

      assert_select "input#keyword_keyword[name=?]", "keyword[keyword]"

      assert_select "input#keyword_list_name[name=?]", "keyword[list_name]"
    end
  end
end
