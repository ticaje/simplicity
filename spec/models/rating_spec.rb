require 'spec_helper'

describe Rating do
  before do
    @rating = create(:rating)
  end

  subject { @rating }

  it "has a valid factory" do
    @rating.should be_valid
  end

  describe "associations" do
    it { @rating.should have_many(:votes) }
  end

  describe "validations" do

    context "uniqueness" do
      it { @rating.should validate_uniqueness_of(:name) }
    end

    context "presence" do
      it { @rating.should validate_presence_of(:name) }
    end
  end
end
