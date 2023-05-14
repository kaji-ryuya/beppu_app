require 'rails_helper'

RSpec.describe "spas/new", type: :view do
  before(:each) do
    assign(:spa, Spa.new(
      name: "MyString"
    ))
  end

  it "renders new spa form" do
    render

    assert_select "form[action=?][method=?]", spas_path, "post" do

      assert_select "input[name=?]", "spa[name]"
    end
  end
end
