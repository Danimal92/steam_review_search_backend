Rails.application.routes.draw do
  resources :reviews
  resources :games

get 'gather_reviews/:id' => 'games#gather_reviews'
  





end
