require 'spec_helper'

describe Request do
  before do
    @request = create(:request)
  end

  subject { @request }

  it "has a valid factory" do
    @request.should be_valid
  end

  describe "Associations" do
    it { should belong_to(:article) }
    it { should belong_to(:requestype) }
    it { should have_many(:user_requests) }
  end
end
