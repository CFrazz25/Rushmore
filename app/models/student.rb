class Student < ApplicationRecord
  belongs_to :teacher, optional: true

  validates_presence_of :name, :grade_level, :gender, :gpa
  validates :teacher_id, presence: true, allow_nil: true
end
