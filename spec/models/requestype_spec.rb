require 'spec_helper'

describe Requestype do
  before do
    @requestype = create(:requestype)
  end

  subject { @requestype }

  it "has a valid factory" do
    @requestype.should be_valid
  end

  describe "associations" do
    it { @requestype.should have_many(:requests) }
  end

  describe "validations" do

    context "uniqueness" do
      it { @requestype.should validate_uniqueness_of(:name) }
    end

    context "presence" do
      it { @requestype.should validate_presence_of(:name) }
    end
  end
end
