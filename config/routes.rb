Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    resources :examples
    resources :urls
    resources :clicks
  end
end
