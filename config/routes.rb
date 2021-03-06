Rails.application.routes.draw do

  root to:'homes#top' ,as:'root'
  get 'home/about' => 'homes#about' ,as:'about'

  devise_for :users

  resources:users,only:[:index,:edit,:update,:show]

  resources:books,only:[:index,:show,:create,:edit,:update,:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
