ExpertsOnHand::Application.routes.draw do
  get "checkin/index"
  devise_for :users
  root to: 'checkin#index'
end
