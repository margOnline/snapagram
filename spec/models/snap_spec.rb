require "rails_helper"

RSpec.describe Snap do
  it { should have_many :comments }
  it { should have_many :notifications }
  it { should belong_to :user }
  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
    allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
end