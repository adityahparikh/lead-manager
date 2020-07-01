class AccountsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }, prepend: true

  def create_account
    begin
      @account = Account.new(account_params)
      if @account.valid?
        Apartment::Tenant.create(@account.subdomain)
        Apartment::Tenant.switch!(@account.subdomain)

        if @account.save
          protocol = 'http://'
          if Rails.env.production?
            protocol = 'https://'
          end
          redirect_url = protocol + @account.subdomain + '.' + Rails.application.secrets[:mailer_options][:host] + ':' + Rails.application.secrets[:mailer_options][:port].to_s

          render json: {
            success: true,
            redirect_url: redirect_url
          }, status: :created
          return
        else
          render json: {}, status: :unprocessable_entity
          return
        end
      else
        render json: {}, status: :unprocessable_entity
        return
      end
    rescue
      render json: { error: {subdomain: true}}, status: :unprocessable_entity
      return
    end
    
    render json: {error: {unknown: true}}, status: :ok
    return
  end

  private
  def account_params
    params.require(:account).permit(:subdomain)
  end
end
