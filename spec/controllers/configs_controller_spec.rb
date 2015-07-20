require 'rails_helper'

describe ConfigsController, type: :controller do

  describe "PUT #update" do
    it "updates the settings" do
      put :update
      expect(response.status).to be(200)
    end
  end
end
