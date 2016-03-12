require 'rails_helper'

RSpec.describe Comment do
  it { should belong_to :user }
  it { should belong_to :snap }
end
