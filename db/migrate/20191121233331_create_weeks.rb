class CreateWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :weeks do |t|
      t.string :title
      t.belongs_to :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
