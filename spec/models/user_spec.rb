require 'rails_helper'

RSpec.describe User do
  it { should have_many :snaps }
  it { should have_many :comments}
  it { should validate_presence_of :username }
  it { should validate_length_of(:username)
    .is_at_least(4).is_at_most(25) 
  }
end
