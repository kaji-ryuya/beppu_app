require 'rails_helper'

RSpec.describe "spas/index", type: :view do
  before(:each) do
    assign(:spas, [
      Spa.create!(
        name: "Name"
      ),
      Spa.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of spas" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
