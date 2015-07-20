require 'rails_helper'

describe ConfigsController, type: :controller do

  describe "PUT #update" do
    it "updates the settings" do
      request.env['HTTP_REFERER'] = root_path
      put :update
      expect(response).to redirect_to(request.referer)
    end
  end
end
