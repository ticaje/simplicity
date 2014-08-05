class TranslationsController < ApplicationController
  respond_to :json

  # GET /translations
  # GET /translations.json
  def index
    @translations = Translation.all
    render_with(@translations)
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
    @translation = Translation.find_by_id(params[:id])
    # Render status code: Found
    unless @translation
      render_with(@translation, 302)
    else
      render_with(@translation, 404)
    end
  end

  # GET /translations/new
  # GET /translations/new.json
  def new
    @translation = Translation.new
    render_with(@translation)
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = Translation.create(params[:translation])
    if @translation.save
      # Render status code: Created
      render_with(@translation, 201)
    else
      # Render status code: Unprocessable entity
      render_with(@translation.errors, 422, 'Could not create ')
    end
  end

  # PUT /translations/1
  # PUT /translations/1.json
  def update
    @translation = Translation.find_by_id(params[:id])

    if @translation && @translation.update_attributes(params[:translation])
      # Render status code: ok
      render_with(@translation, 200)
    else
      # Render status code: Unprocessable entity
      render_with(@translation, 422)
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation = Translation.find_by_id(params[:id])
    if @translation
      @translation.destroy
      render_with(nil, 200, "Deleted!!!")
    else
      render_with(nil, 404, "Record not found")
    end
  end
end
