Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    get '/api/v1/new_search', to: 'test#start'


  get '/test', to: 'test#start'

end
