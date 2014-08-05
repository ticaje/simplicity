class RegistrationsController < Devise::RegistrationsController

  def create
    super
    session[:omniauth] = nil unless resource.new_record?
  end

  protected
  def after_sign_up_path_for(resource)
    root_path
  end
end
