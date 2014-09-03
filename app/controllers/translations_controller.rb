class TranslationsController < ApplicationController
  filter_resource_access
  layout "translation"

  # GET /translations
  # GET /translations.json
  def index
    if (current_user && !current_user.translations.empty?)
      @translations = current_user.translations
    else
      @translations = Translation.all
    end
  end

  def show
    respond_with_decorated(:translation)
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
      redirect_to translate_path(@article)
    end
  end

  # PUT /translations/1
  # PUT /translations/1.json
  def update
    if @translation && @translation.update_attributes(params[:translation])
      redirect_to @translation, notice: "Translation was successfully updated."
    else
      render "edit"
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy
    redirect_to translations_url, notice: "Translation successfully deleted"
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @translation = Translation.find(params[:id])
    @translation.add_evaluation(:points, value, current_user)
    redirect_to translation_url(@translation), notice: "Thank you for voting!"
  end
end
