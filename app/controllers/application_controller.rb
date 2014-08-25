class ApplicationController < ActionController::Base
  respond_to :html

  protect_from_forgery
  before_filter { |c| Authorization.current_user = c.current_user }

  def permission_denied
    flash[:error] = "Sorry, you not allowed to access that page."
    redirect_to root_url
  end

  def render_with(result_info, status_code = 200, message = "Transaction Ok")
    json_response = { :result => result_info, :status => status_code, :message => message}
    render json: json_response
  end

  protected

  def respond_with_decorated(variable_name, *args)
    respond_with(decorate_resource(variable_name), *args)
  end

  def decorate_resource(name)
    instance_variable_set("@#{name}", instance_variable_get("@#{name}").decorate)
  end

end
