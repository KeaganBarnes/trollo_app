class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :lift
      t.string :sets
      t.string :reps
      t.string :percentage
      t.string :week
      t.string :day
      
      t.timestamps
    end
  end
end
