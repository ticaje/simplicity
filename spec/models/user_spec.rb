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
    it { should have_many(:user_requests) }
    it { should have_many(:requests) }
  end

  describe "Empty fields" do
    it { @user.should validate_presence_of(:username) }
    it { @user.should validate_presence_of(:email) }
  end

  describe "When email format is invalid" do
    it "has an invalid email format" do
      addresses = %w[user@foo, com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "When username is longer than 50 characters" do
    it "username is restricted to 50 characters" do
      @user.username = "a" * 51
      @user.should_not be_valid
    end
  end
end
