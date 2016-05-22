class User < ActiveRecord::Base
  attr_accessor :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :subjects

  ROLES = %w[professor student]

  def role_symbols
    [role.to_sym]
  end
end
