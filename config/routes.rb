Rails.application.routes.draw do

  resources :posts, only: [:create, :new] do

    resources :comments, only: [:create, :new] do
      # like a comment
      resources :likes, only: [] do
        collection do
          delete '' => 'likes#comment_unlike', as: ''
          post "" => 'likes#comment_like'
        end
      end  
    end  

    # like a post
    resources :likes, only: [] do
      collection do
        delete '' => 'likes#post_unlike', as: ''
        post '' => 'likes#post_like'
      end
    end
    
  end

  devise_for :users
  root "site#index"

end