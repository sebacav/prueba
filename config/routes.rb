Rails.application.routes.draw do
  # resources :people # resource is the rest-full api given a model

  # this is the routing path component, that permit to the user, navigate through our API
  # anything other path will return status code 500

  # HTTP_Method Path, to: Controller#Method_in_controller
  get     '/people',             to: 'people#index'
  get     '/people/:nationalId', to: 'people#show'
  delete  '/people/:nationalId', to: 'people#destroy'
  put     '/people/:nationalId', to: 'people#update'
  post    '/people',             to: 'people#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
