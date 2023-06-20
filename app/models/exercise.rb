class Exercise < ApplicationRecord
  belongs_to :user
  has_many :exercise_set, dependent: :destroy
end
