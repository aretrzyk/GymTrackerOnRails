class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|

      t.timestamps
    end
  end
end
