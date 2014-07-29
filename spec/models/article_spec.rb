require 'spec_helper'

describe Article do
  before do
    @article = create(:article)
  end

  subject { @article }

  it "has a valid factory" do
    @article.should be_valid
  end

  describe "Associations" do
    it { should belong_to(:category) }
    it { should have_many(:translations) }
    it { should have_many(:requests) }
  end

  describe "Validations" do
    context "Uniqueness" do
      it { @article.should validate_uniqueness_of(:name) }
    end
    context "Presence" do
      it { @article.should validate_presence_of(:name) }
      it { @article.should validate_presence_of(:content) }
    end
  end
end
