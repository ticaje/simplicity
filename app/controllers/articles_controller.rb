class ArticlesController < ApplicationController
  filter_resource_access

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.top_requested
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
end
