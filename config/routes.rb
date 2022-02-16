Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'service#index'
  get 'service/next_call', :controller => 'service', :action => 'next_call', :as => 'next_call'
end
