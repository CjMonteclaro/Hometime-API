Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :reservations
      resources :guests
    end
  end
end
