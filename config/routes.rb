Rails.application.routes.draw do
  root 'games#index'

  get '/', to: 'games#index'
  post '/', to: 'games#reveal'
end
