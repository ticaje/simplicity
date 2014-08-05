class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_with(result_info, status_code = 200, message = "Transaction Ok")
    json_response = { :result => result_info, :status => status_code, :message => message}
    render json: json_response
  end

end
