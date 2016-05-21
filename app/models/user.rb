class User < ActiveRecord::Base
  attr_accessor :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :subjects

  def student?
    role == 'student'
  end

  def professor?
    role == 'professor'
  end
end
