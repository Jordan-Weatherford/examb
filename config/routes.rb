Rails.application.routes.draw do
    root 'users#index'

    get '/bright_ideas' => 'ideas#ideas'
    get '/logout' => 'users#logout'
    get '/like/:idea_id' => 'ideas#like'
    get '/destroy_idea/:idea_id' => 'ideas#destroy'
    get '/likes/:idea_id' => 'ideas#show'
    get '/user/:user_id' => 'users#user_info'

    post '/login' => 'users#login'
    post '/register' => 'users#register'
    post '/new_idea' => 'ideas#new'
end
