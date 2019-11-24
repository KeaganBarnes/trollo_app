class AddRefToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_reference :workouts, :program, foreign_key: true
  end
end
