Rails.application.routes.draw do
  namespace :rails, defaults: { format: :json } do
    namespace :user_profile do
      put 'user/:id', to: "users_registrations#update"
      get 'users', to: "users_registrations#index"
      post 'user', to: "users_registrations#create"
      post 'request/:user_id', to: "create_request#create"
      put 'request/:request_id', to: "create_request#update"
      post 'upload/:user_id', to: "upload_documents#create"
      namespace :rooms do
        get 'room/:user_id' ,to: "rooms_registrations#show"
        post 'room' ,to: "rooms_registrations#create"
        # delete 'room',to: "rooms_registrations#destroy"
      end
    end
  end
end
