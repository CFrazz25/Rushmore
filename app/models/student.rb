require 'csv'

class Student < ApplicationRecord
  belongs_to :teacher, optional: true

  validates_presence_of :first_name, :last_name, :grade_level, :gender, :gpa
  validates :teacher_id, presence: true, allow_nil: true
  validates_uniqueness_of :student_id

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Student.create row.to_hash
    end
  end

  def ineligible?
    if self.gpa < 2.0
      return true
    end
  end
end
