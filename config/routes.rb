Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # 3) index - lister les tâches
  get "tasks", to: "tasks#index", as: :tasks

  # 5) new + create : je crée une nouvelle tâche
  get  "tasks/new", to: "tasks#new", as: :new_task
  post "tasks",     to: "tasks#create"

  # 4) show (après /new) les détails d'une tâche
  get "tasks/:id", to: "tasks#show", as: :task

  # 6) edit + update
  get   "tasks/:id/edit", to: "tasks#edit", as: :edit_task
  patch "tasks/:id",      to: "tasks#update"

  # 7) destroy
  delete "tasks/:id", to: "tasks#destroy"
end
