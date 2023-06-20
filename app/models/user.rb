class User < ApplicationRecord
  include Clearance::User
  has_many :workouts, dependent: :destroy
  has_many :exercises, dependent: :destroy
end
