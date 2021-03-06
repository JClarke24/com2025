Rails.application.routes.draw do
  # Paths for devise
  devise_for :users

  # Resource paths.
  resources :albums do
    resources :pictures, except: [:index, :edit]
  end

  # Home page is the root.
  root 'home#home'

  # Contact page.
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
