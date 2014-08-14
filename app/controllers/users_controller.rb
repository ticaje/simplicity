class UsersController < ApplicationController
  before_filter :authenticate_user!

  def ask
    response = Manu::Requests::Assignment.new.request_translation(current_user, params[:article])
    redirect_to root_path(), notice: response
  end

  def translate
    @translation = current_user.translations.new
    @article = Article.find(params[:article])
    render "translations/new"
  end

end
