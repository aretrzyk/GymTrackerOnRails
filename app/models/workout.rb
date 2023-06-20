class Workout < ApplicationRecord
  has_many :exercise_set, dependent: :destroy
end
