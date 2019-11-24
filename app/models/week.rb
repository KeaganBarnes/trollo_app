class Week < ApplicationRecord
  belongs_to :program
  has_many :days

  def self.all_weeks(user_id, program_id)
    Week.find_by_sql(
      "SELECT *
      FROM weeks AS w
      WHERE w.user_id = #{user_id} 
      AND w.program_id = #{program_id}"
    )
  end

end
