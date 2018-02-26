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
  
  resources :meal_foods

  resources :category_foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
