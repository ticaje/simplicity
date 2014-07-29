require 'spec_helper'

describe Translation do
  before do
    @translation = create(:translation)
  end

  subject { @translation }

  it "has a valid factory" do
    @translation.should be_valid
  end

  describe "Associations" do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
    it { should have_many(:votes) }
  end

  describe "Validations" do
    context "Presence" do
      it { @translation.should validate_presence_of(:content) }
    end
  end
end
