require "#{Rails.root}/lib/constraints/domain_constraint.rb"

Rails.application.routes.draw do
  devise_for :users

  constraints DomainConstraint.new([:professors_domain]) do
    resources :professors, controller: "professors/professors"
    get '/' => 'professors#index'
  end

  constraints DomainConstraint.new([:students_domain]) do
    resources :students, controller: "students/students"
    get '/' => 'students#index'
  end

  root to: 'welcome#index'
end
