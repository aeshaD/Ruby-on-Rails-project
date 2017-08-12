Rails.application.routes.draw do
 
  get 'icategories/index'

  get 'icategories/new'

  get 'icategories/edit'
  get 'incomes/show'
  get 'expenses/index'

  get 'expenses/show'

  get 'expenses/new'

  get 'expenses/edit'


  get 'users/index'

  get 'users/new'

  get 'access/index' 

  get 'access/login'
  
  resources :users
  resources :categories
  resources :icategories
  resources :incomes
  resources :expenses
   match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
