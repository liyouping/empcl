Rails.application.routes.draw do

  namespace :admin do
    # devise_for :admins, controllers: {
    #     sessions: 'admin/sessions'
    # }
    root 'home#index'
    devise_for :admins, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  end

   scope "(:locale)", locale: /en|zh_CN/ do
    root 'home#index'
    resources :home do
      collection do
        get 'contact'
        post 'send_msg'
      end
    end
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
