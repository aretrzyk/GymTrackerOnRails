class AddUserToExercises < ActiveRecord::Migration[6.0]
  def change
    add_reference :exercises, :user, foreign_key: true
  end
end