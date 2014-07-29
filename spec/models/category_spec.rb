# encoding: utf-8
require 'spec_helper'

describe Category do

  before do
    @category = create(:category)
  end

  subject { @category }

  it "has a valid factory" do
    @category.should be_valid
  end

  describe "associations" do
    it { @category.should have_many(:articles) }
  end

  describe "validations" do

    context "uniqueness" do
      it { @category.should validate_uniqueness_of(:name) }
    end

    context "presence" do
      it { @category.should validate_presence_of(:name) }
    end
  end

end
