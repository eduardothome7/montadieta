Rails.application.routes.draw do
  
  resources :diets do 
    resources :meals do 
      collection do
    	  get :add
  	  end
    end
  end

  resources :foods do 
    collection do
      get :search
    end
  end
  
  resources :meal_foods do 
    collection do
      get :add
    end
  end

  resources :category_foods

  root 'diets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
