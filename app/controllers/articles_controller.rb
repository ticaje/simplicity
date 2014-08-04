class ArticlesController < ApplicationController
  respond_to :json

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    render_with(@articles)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find_by_id(params[:id])
    # Render status code: Found
    unless @article
      render_with(@article, 302)
    else
      render_with(@article, 404)
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    #render json: @article
    render_with(@article)
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.create(params[:article])
    if @article.save
      # Render status code: Created
      render_with(@article, 201)
    else
      # Render status code: Unprocessable entity
      render_with(@article.errors, 422, 'Could not create ')
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find_by_id(params[:id])

    if @article && @article.update_attributes(params[:article])
      # Render status code: ok
      render_with(@article, 200)
    else
      # Render status code: Unprocessable entity
      render_with(@article, 422)
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find_by_id(params[:id])
    if @article
      @article.destroy
      render_with(nil, 200, "Deleted!!!")
    else
      render_with(nil, 404, "Record not found")
    end
  end

  private

  def render_with(result_info, status_code = 200, message = "Transaction Ok")
    json_response = { :result => result_info, :status => status_code, :message => message}
    render json: json_response
  end

end
