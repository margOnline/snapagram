require 'rails_helper'

RSpec.describe User do
  it { should have_many :snaps }
  it { should have_many :comments}
  it { should have_many :notifications }
  it { should validate_presence_of :username }
  it { should validate_length_of(:username).is_at_most(25) }

  describe "notifications" do
    let(:user) {FactoryGirl.create(:user) }
    let(:notifications) {[double(:notification, user: user, read: true), double(:notification, user: user, read: false)]}

    context "any unread?" do
      xit "returns true if any notifications have not been read" do
        expect(user.has_unread_notifications?).to be_truthy
      end
    end

    context "unread" do
      xit "returns an array of notifications which have not been read" do
        expect(user.unread_notifications.count).to eq 1
      end
    end
  end

end
