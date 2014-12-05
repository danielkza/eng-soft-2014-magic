Rails.application.routes.draw do
  devise_for :users

  root :to => get('static_pages/home')
end
