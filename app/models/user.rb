class User < ActiveRecord::Base
  attr_accessor :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def student?
    role == 'student'
  end

  def professor?
    role == 'professor'
  end
end
