require 'rails_helper'

RSpec.describe "spas/edit", type: :view do
  let(:spa) {
    Spa.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:spa, spa)
  end

  it "renders the edit spa form" do
    render

    assert_select "form[action=?][method=?]", spa_path(spa), "post" do

      assert_select "input[name=?]", "spa[name]"
    end
  end
end
