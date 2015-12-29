require 'rails_helper'

RSpec.describe "keywords/show", type: :view do
  before(:each) do
    @keyword = assign(:keyword, Keyword.create!(
      :keyword => "Keyword",
      :list_name => "List Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Keyword/)
    expect(rendered).to match(/List Name/)
  end
end
