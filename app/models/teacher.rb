class Teacher < ApplicationRecord
  has_many :students

  validates_presence_of :name, :email, :hashed_password
  validates_uniqueness_of :email

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    teacher = Teacher.find_by(email: email)
    return teacher if teacher && teacher.password == password
  end

  def ineligible
    students = Students.all
    students.where("gpa < ?", 2.0)
  end
end
