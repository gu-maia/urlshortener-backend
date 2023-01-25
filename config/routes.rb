Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    resources :examples

    #urls
    resources :urls, only: [:index, :create]
    get 'urls/:key', to: 'urls#show'

    #clicks
    resources :clicks
  end
end
