class ApplicationController < ActionController::Base

  before_action :load_schema

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
