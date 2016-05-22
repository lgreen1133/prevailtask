class Subject < ActiveRecord::Base
  # Having one single user model, perhaps we can do
  belongs_to :professor, :class_name => "User", :foreign_key => 'user_id'
  belongs_to :student, :class_name => "User", :foreign_key => 'user_id'
end
