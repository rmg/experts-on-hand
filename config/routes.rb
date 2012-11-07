ExpertsOnHand::Application.routes.draw do
  get "checkin/index"
  post "checkin/create"
  devise_for :users
  root to: 'checkin#index'
end
