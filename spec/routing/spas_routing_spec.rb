require "rails_helper"

RSpec.describe SpasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/spas").to route_to("spas#index")
    end

    it "routes to #new" do
      expect(get: "/spas/new").to route_to("spas#new")
    end

    it "routes to #show" do
      expect(get: "/spas/1").to route_to("spas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/spas/1/edit").to route_to("spas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/spas").to route_to("spas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/spas/1").to route_to("spas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/spas/1").to route_to("spas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/spas/1").to route_to("spas#destroy", id: "1")
    end
  end
end
