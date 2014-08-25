class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only:[:new]
  before_filter :find_categories_and_tabs
  filter_access_to [:category]
  filter_resource_access

  # GET /articles
  # GET /articles.json
  def index
    if (search = params[:search]) && (Article.respond_to?(search.to_sym))
      @articles = Article.send(search)
    else
      @articles = Article.top_requested
    end
  end

  # GET /articles
  # GET /articles.json
  def category
    @articles = Article.with_category(params[:category], params[:search] || "top_requested")
    respond_with(:articles, template: "articles/index")
  end

  # POST /articles
  # POST /articles.json
  def create
    @user = current_user
    @article = @user.articles.create(params[:article])

    if @article.save
      response = Manu::Requests::Assignment.new.request_translation(@user, @article)
      redirect_to @article, notice: "Article was successfully created."
    else
      render "new"
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    if @article && @article.update_attributes(params[:article])
      redirect_to @article, notice: "Article was successfully updated."
    else
      render "edit"
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully deleted"
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @article = Article.find(params[:id])
    @article.add_evaluation(:points, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end

private

  def find_categories_and_tabs
    @categories = Category.all
    if (search = params[:search]) && (Article.respond_to?(search.to_sym))
      @tab = search
    else
      @tab = "top_requested"
    end
  end

end
