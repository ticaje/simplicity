require 'spec_helper'

describe Vote do
  before do
    @vote = create(:vote)
  end

  subject { @vote }

  it "has a valid factory" do
    @vote.should be_valid
  end

  describe "Associations" do
    it { should belong_to(:translation) }
    it { should belong_to(:rating) }
    it { should belong_to(:user) }
  end
end
