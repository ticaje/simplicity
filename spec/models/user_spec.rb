require 'spec_helper'

describe User do

  before do
    @user = create(:user)
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:active) }

  it "has a valid factory" do
    @user.should be_valid
  end

  describe "Associations" do
    it { should have_many(:translations) }
    it { should have_many(:votes) }
    it { should have_many(:articles) }
    it { should have_many(:petitions) }
    it { should have_many(:requests) }
  end

  describe "Empty fields" do
    it { @user.should validate_presence_of(:username) }
    it { @user.should validate_presence_of(:email) }
  end

  describe "When username is longer than 50 characters" do
    it "username is restricted to 50 characters" do
      @user.username = "a" * 51
      @user.should_not be_valid
    end
  end
end
