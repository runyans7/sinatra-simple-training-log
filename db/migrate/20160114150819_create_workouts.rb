class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :workout_type
      t.integer :time_in_seconds
      t.float :distance
      t.integer :user_id

      t.timestamps nulll: false
    end
  end
end
