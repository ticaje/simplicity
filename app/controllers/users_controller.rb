class UsersController < ApplicationController
  respond_to :json

  def ask
    u_id = params[:petition][:user_id]
    a_id = params[:petition][:article_id]
    response = Manu::Requests::Assignment.new.request_translation(u_id, a_id)
    render_with(response)
  end

end
