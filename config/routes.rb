Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    resources :examples

    #urls
    resources :urls, only: [:index, :create]
    get 'urls/:key', to: 'urls#show'

    #clicks
    resources :clicks
  end

  post '/api-keys', to: 'api_keys#create'
  delete '/api-keys', to: 'api_keys#destroy'
  get '/api-keys', to: 'api_keys#index'
end
