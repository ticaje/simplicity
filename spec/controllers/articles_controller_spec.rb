require 'spec_helper'

describe ArticlesController do

  render_views

  def valid_attributes(param = :article)
    FactoryGirl.attributes_for(param)
  end

  describe "GET #index" do
    it "populates an array with all articles" do
      articles = create_list(:article, 5)
      get :index
      assigns(:articles).should eq(articles)
    end
  end

  describe "GET #show" do
    it "assigns requested article to @article" do
      article = create(:article)
      get :show, id: article
      assigns(:article).should be_a(Article)
    end
    it "passes an id to a non existing article" do
      get :show, id: -1
      assigns(:article).should be_nil
    end
  end

  describe "GET new" do
    it "assigns a new article as @article" do
      get :new
      assigns(:article).should be_a_new(Article)
    end
  end

  describe "POST create" do
    describe "With valid params" do
      before :each do
        post :create, :article => valid_attributes
      end
      it "creates a new Article" do
        expect {
          post :create, :article => valid_attributes
        }.to change(Article, :count).by(1)
      end
      it "assigns a newly created article as @article" do
        assigns(:article).should be_a(Article)
        assigns(:article).should be_persisted
      end
      it "assings a category value" do
        assigns(:article).category_id.should_not be_nil
      end
    end

    describe "With invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        Article.any_instance.stub(:save).and_return(false)
        post :create, {:article => {}}
        assigns(:article).should be_a_new(Article)
      end
      it "no params required values" do
        expect {
          post :create, :article => valid_attributes(:invalid_article)
        }.not_to change(Article, :count)
      end
      it "provides non existing category" do
        expect {
          post :create, :article => valid_attributes(:article_with_non_existing_category)
        }.not_to change(Article, :count)
      end
    end
  end

  describe "PUT update" do
    before :each do
      @article = create(:article)
    end
    context "With valid parameters" do
      it "finds the requested article" do
        put :update, id: @article, article: valid_attributes(:article)
        assigns(:article).should eq(@article)
      end
      it "changes the article attributes as expected" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article, name: "Funny name")
        @article.reload
        @article.name.should eq("Funny name")
      end
    end
    context "With invalid parameters" do
      it "doesn't find the article to update" do
        put :update, id: -1
        assigns(:article).should be_nil
      end
    end
  end

  describe "DELETE destroy" do
    context "With existing id" do
      before :each do
        @article = create(:article)
      end
      it "deletes the article" do
        expect {
          delete :destroy, id: @article
        }.to change(Article, :count).by(-1)
      end
    end
    context "With non existing id" do
      before :each do
        delete :destroy, id: -1
      end
      it "does nothing" do
        expect {
        }.to change(Article, :count).by(0)
      end
    end
  end

end
