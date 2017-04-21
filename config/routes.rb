Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions' },path: 'admin'
  namespace :admins ,path: 'admin' do
    root 'messages#index'
    resources :messages
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
