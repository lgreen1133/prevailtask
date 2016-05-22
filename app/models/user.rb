class User < ActiveRecord::Base
  enum role: [:professor, :student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :subjects

end
