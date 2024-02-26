Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :acquirers, only: [:create]
  resources :clients, only: [:create, :index]
  resources :sessions, only: [:login]
  get "/sessions", to: "sessions#login"
  post "/sessions", to: "sessions#login"
  post '/tables', to: 'tables#add_row'
  get '/tables', to: 'tables#index'
  get 'tables/search', to: 'tables#search'
  resources :rates, only: [:create, :index]
  post '/transactiontables', to: 'transactiontables#add_row'
  get '/transactiontables', to: 'transactiontables#index'
  resources :createsettlements, only: [:index, :show] do
    collection do
      get ':company_name', to: 'createsettlements#show'
    end
  end
  post '/transactionreport', to: 'transactionreport#search'


  post '/mastersettings/businesstype', to: 'mastersettings#createBusinesstypes'
  get '/mastersettings/businesstype', to: 'mastersettings#showBusinesstypes'

  post '/mastersettings/categories', to: 'mastersettings#createCategory'
  get '/mastersettings/categories', to: 'mastersettings#showCategory'

  post '/mastersettings/businesssubcategories', to: 'mastersettings#createSubcategory'
  get '/mastersettings/businesssubcategories', to: 'mastersettings#showSubcategory'

  post '/mastersettings/currency', to: 'mastersettings#createCurrency'
  get '/mastersettings/currency', to: 'mastersettings#showCurrency'

  post '/mastersettings/documenttype', to: 'mastersettings#createDocumenttype'
  get '/mastersettings/documenttype', to: 'mastersettings#showDocumenttype'

  post '/mastersettings/documentcategory', to: 'mastersettings#createDocumentcategory'
  get '/mastersettings/documentcategory', to: 'mastersettings#showDocumentcategory'

  post '/mastersettings/bank', to: 'mastersettings#createBank'
  get '/mastersettings/bank', to: 'mastersettings#showBank'
end
