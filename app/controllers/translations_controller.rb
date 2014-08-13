class TranslationsController < ApplicationController
  filter_resource_access

  # GET /translations
  # GET /translations.json
  def index
    if current_user
      @translations = current_user.translations
    else
      @translations = Translation.all
    end
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
    @translation = Translation.find_by_id(params[:id])
  end

  def edit
    @translation = Translation.find(params[:id])
  end

  # GET /translations/new
  # GET /translations/new.json
  def new
    @translation = Translation.new
  end

  # POST /translations
  # POST /translations.json
  def create
    @user = current_user
    @translation = @user.translations.create(params[:translation])

    if @translation.save
      redirect_to @translation, notice: "Translation was successfully created."
    else
      @article = Article.find(params[:translation][:article_id])
      render "users/translate"
    end
  end

  # PUT /translations/1
  # PUT /translations/1.json
  def update
    @translation = Translation.find_by_id(params[:id])

    if @translation && @translation.update_attributes(params[:translation])
      redirect_to @article, notice: "Translation was successfully updated."
    else
      render "edit"
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation = Translation.find_by_id(params[:id])
    @translation.destroy
    redirect_to translations_url
  end
end
