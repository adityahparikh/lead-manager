class ApplicationController < ActionController::Base

  before_action :load_schema
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name])
    devise_parameter_sanitizer.permit(:invite) do |u|
      u.permit :email, :userrole_id, {:department_ids => []}
    end
  end

  private
  
  def load_schema
    Apartment::Tenant.switch!('public')
    return unless request.subdomain.present?

    if current_account
      Apartment::Tenant.switch!(current_account.subdomain)
    else
      redirect_to root_url(subdomain: false)
    end
  end

  def current_account
    @current_account ||= Account.find_by(subdomain: request.subdomain)
  end
  helper_method :current_account
end
