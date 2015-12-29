require 'rails_helper'

RSpec.describe "keywords/index", type: :view do
  before(:each) do
    assign(:keywords, [
      Keyword.create!(
        :keyword => "Keyword",
        :list_name => "List Name"
      ),
      Keyword.create!(
        :keyword => "Keyword",
        :list_name => "List Name"
      )
    ])
  end

  it "renders a list of keywords" do
    render
    assert_select "tr>td", :text => "Keyword".to_s, :count => 2
    assert_select "tr>td", :text => "List Name".to_s, :count => 2
  end
end
