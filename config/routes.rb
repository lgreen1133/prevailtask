# Rails.application.routes.draw do
#   devise_for :users
#     resources :users
#
#   get 'welcome/index'
#
#
#
#   root to: 'welcome#index'
# end
require "#{Rails.root}/lib/domain_constraint.rb"

Rails.application.routes.draw do
  devise_for :users

  constraints DomainConstraint.new([:professors_domain]) do
    resources :professors
  end

  constraints DomainConstraint.new([:students_domain]) do
    resources :students
  end
end
