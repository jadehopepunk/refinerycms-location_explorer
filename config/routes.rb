Refinery::Core::Engine.routes.append do
  # Frontend routes
  namespace :location_explorer do
    resources :locations, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :location_explorer, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :locations, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end
end
