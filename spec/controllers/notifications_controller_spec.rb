require 'rails_helper'

RSpec.describe NotificationsController do

  describe "#link_through" do
    it "returns http success" do
      notification = FactoryGirl.create(:notification)
      get :link_through, id: notification.id
      expect(notification.reload.read).to be_truthy
      expect(response).to redirect_to snap_path(notification.snap)
    end
  end

end
