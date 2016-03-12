require "rails_helper"


RSpec.describe SnapsController do
  describe "#create" do
    before :each do
      @image = fixture_file_upload('test_image.png', 'image/png')
    end
    it "saves a Snap record" do
      expect { post :create, snap: {
        caption: "logo", image: @image
        }
      }.to change(Snap, :count).by(1)
    end
  end
end