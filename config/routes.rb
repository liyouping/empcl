Rails.application.routes.draw do


  scope "(:locale)", locale: /en|zh_CN/ do
    root 'home#index'
    resources :home do
      collection do
        get :contact
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
