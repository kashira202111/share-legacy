Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#years routes
  get 'years', to: 'years#index'
  post 'years', to: 'years#create'
  get 'years/new', to: 'years#new'
  get 'years/:id', to: 'years#showSubjectList'
#subject routes
  get 'subjects/new', to: 'subjects#new'
  post 'subjects', to: 'subjects#create'

end
