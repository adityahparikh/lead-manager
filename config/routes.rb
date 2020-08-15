class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  constraints(SubdomainPresent) do
    root "dashboard#index", as: :subdomain_root
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

  constraints(SubdomainBlank) do
    root 'homepage#index', as: 'root'
    post '/account/create-account', to: 'accounts#create_account', as: 'accounts_create_account'
  end
end
