Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions' },path: 'admin'
  namespace :admins ,path: 'admin' do
    root 'messages#index'
    resources :messages
    resources :level1_menus do
      member do
        get 'move_position/:type' => 'level1_menus#move_position'
      end
    end
    resources :level2_menus do
      member do
        get 'move_position/:type' => 'level2_menus#move_position'
      end
    end
    resources :level3_menus do
      member do
        get 'move_position/:type' => 'level3_menus#move_position'
      end
    end
    resources :pages do
      collection do
        post 'upload_img'
      end
    end

  end

   scope "(:locale)", locale: /en|zh_CN/ do
    root 'home#index'
    resources :home do
      collection do
        get 'contact'
        post 'send_msg'
      end
    end
    resources :pages
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
