require 'rails_helper'

RSpec.describe Notification do
  it { should belong_to :snap }
  it { should belong_to :notified_by }
  it { should belong_to :user }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :snap_id }
  it { should validate_presence_of :notified_by_id }
  it { should validate_presence_of :notice_type }

  describe "read?" do
    it "returns true if it has been read" do
      notification = FactoryGirl.create(:notification, :read)
      expect(notification.read?).to be_truthy
    end
  end

  describe "unread?" do
    it "returns true if it has not been read" do
      notification = FactoryGirl.create(:notification)
      expect(notification.unread?).to be_truthy
    end
  end
end
