require 'spec_helper'

describe UserRequest do
  before do
    @user_request = create(:user_request)
  end

  subject { @user_request }

  it "has a valid factory" do
    @user_request.should be_valid
  end

  describe "Associations" do
    it { should belong_to(:request) }
    it { should belong_to(:user) }
  end
end
