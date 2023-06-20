class Exercise < ApplicationRecord
  has_many :exercise_set, dependent: :destroy
end
