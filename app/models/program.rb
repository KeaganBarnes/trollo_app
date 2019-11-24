class Program < ApplicationRecord
  belongs_to :user
  has_many :workouts, dependent: :destroy

  def self.all_programs(user_id)
    Program.find_by_sql(
      "SELECT *
      FROM programs AS p
      WHERE p.user_id = #{user_id}"
    )
  end

  def self.single_program(user_id, program_id)
    Program.find_by_sql(["
    SELECT *
    FROM programs AS p
    WHERE p.id = ? AND p.user_id = ?
    ", program_id, user_id]).first
  end

  def self.create_program(p, id)
    Program.find_by_sql(["
      INSERT INTO programs (name, week_duration, days_per_week, user_id, created_at, updated_at)
      VALUES (:name, :week_duration, :days_per_week, :user_id, :created_at, :updated_at)
    ;", {
      name: p[:name],
      week_duration: p[:week_duration],
      days_per_week: p[:days_per_week],
      user_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end

  def self.update_program(program_id, p)
    Program.find_by_sql(["
      UPDATE programs AS p 
      SET name = ?, updated_at = ?
      WHERE p.id = ?
    ;", p[:name], DateTime.now, program_id])
  end

  def self.delete_customer(customer_id)
    Program.find_by_sql(["
      DELETE FROM programs AS p
      WHERE p.id = ?
    ;", program_id])
  end

end
