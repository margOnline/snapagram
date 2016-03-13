require 'rails_helper'

RSpec.describe Comment do
  it { should belong_to :user }
  it { should belong_to :snap }
  it { should validate_length_of(:content)
    .is_at_least(3).is_at_most(300) }
end
