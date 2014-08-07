require 'spec_helper'

describe Manu::Requests::Assignment do

  assignment = Manu::Requests::Assignment.new

  describe "Creates a new request translation" do
    before :each do
      @user = FactoryGirl.create(:user)
      @article = FactoryGirl.create(:article)
    end
    context "With valid arguments" do
      it "inserts a new record" do
        expect {
          answer = assignment.request_translation(@user,@article)
        }.to change(Request, :count).by(1)
      end
    end
    context "With invalid arguments" do
      context "With non existing user" do
        it "records count remains the same" do
          @user = nil
          expect {
            answer = assignment.request_translation(@user,@article)
          }.to change(Request, :count).by(0)
        end
      end
      context "With non existing article" do
        it "records count remains the same" do
          @article = nil
          expect {
            answer = assignment.request_translation(@user,@article)
          }.to change(Request, :count).by(0)
        end
      end
      context "With existing user for article" do
        it "records count remains the same" do
          answer = assignment.request_translation(@user,@article)
          expect {
            answer = assignment.request_translation(@user,@article)
          }.to change(Request, :count).by(0)
        end
      end
    end
  end

end
