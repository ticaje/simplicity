require 'spec_helper'

describe TranslationsController do

  render_views

  def valid_attributes(param = :translation)
    FactoryGirl.attributes_for(param)
  end

  describe "GET #index" do
    it "populates an array with all translations" do
      create_list(:translation, 5)
      get :index
      assigns(:translations).count.should eq(Translation.count)
    end
  end

  describe "GET #show" do
    before :each do
      @translation = create(:translation)
    end
    it "assigns requested translation to @translation" do
      get :show, id: @translation
      assigns(:translation).should be_a(Translation)
    end
    it "passes an id to a non existing translation" do
      @translation.id = -1
      get :show, id: @translation
      assigns(:translation).should be_nil
    end
  end

  describe "GET new" do
    it "assigns a new translation as @translation" do
      get :new
      assigns(:translation).should be_a_new(Translation)
    end
  end

end
