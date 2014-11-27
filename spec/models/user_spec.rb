require 'rails_helper'

describe User do

  it { should have_many(:friendships_requested) }
  it { should have_many(:friendships_received) }
  it { should have_many(:friendees) }
  it { should have_many(:frienders) }
  it { should have_many(:lists) }
  it { should have_many(:entries) }

end
