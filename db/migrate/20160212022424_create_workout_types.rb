class CreateWorkoutTypes < ActiveRecord::Migration
  def change
    create_table :workout_types do |t|
      t.string :workout_type

      t.timestamps null: false
    end
  end
end
