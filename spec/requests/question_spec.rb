require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/question/index"
      expect(response).to have_http_status(:success)
    end
  end

end
