Rails.application.routes.draw do
  resources :phases
  resources :courses
  resources :departments
  resources :project_areas
  resources :project_categories
  # Root
  root "projects#index"

  # Devise
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  # Resources
  resources :users
  resources :judge_evaluations
  resources :project_event_details
  resources :social_impacts
  resources :collaborators
  resources :abstracts
  resources :project_details
  resources :institutions
  resources :questions
  resources :editions
  resources :staff_members
  resources :committee_members
  resources :operatives
  resources :administrators
  resources :judges
  resources :professors
  resources :students
  resources :projects do
    resource :committee_evaluation
    resource :virtual_sample do
      resource :comments, only: [:create, :index, :destroy]
    end
  end

  get "virtual_samples", action: :index, controller: "virtual_samples"

  # Change status
  get "project_status", to: "projects#project_status", as: "project_status"
  post "update_project_status", to: "projects#update_project_status", as: "update_project_status"

  get "mailing_center", to: "mailing#mailing_center", as: "mailing_center"
  post "send_email", to: "mailing#send_email", as: "send_email"

  # Filters
  get "filter_projects", to: "projects#filter_projects", as: "filter_projects"
  get "filter_virtual_samples", to: "virtual_samples#filter_virtual_samples", as: "filter_virtual_samples"
  get "filter_options", to: "filter#filter_options", as: "filter_options"

  # Select projects
  get "select_projects", to: "projects#select_projects", as: "select_projects"
  post "select_projects", to: "projects#update_selected_projects", as: "update_selected_projects"
end
