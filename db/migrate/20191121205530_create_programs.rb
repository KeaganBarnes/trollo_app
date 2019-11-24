class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :week_duration
      t.string :days_per_week
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
