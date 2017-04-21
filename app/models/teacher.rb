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

  def finalize_draft(students)
    #checking gender
    genders = students.select{ |student| student.gender == "M"}
    if genders.count < 6
      return finalize_errors = "You need an even amount of Male and Female, you need to add #{6 - genders.count} more male students"
    elsif genders.count > 6
      return finalize_errors = "You need an even amount of Male and Female, you need to add #{genders.count - 6} more female students"
    end

    #checking gpa
   avg_gpa = students.reduce(0){|sum, student| sum + student.gpa}/students.count
    if avg_gpa < 2.0
      return  finalize_errors = "You need to choose some students with a higher gpa to make teams as even as possible."
    elsif avg_gpa > 3.0
      return  finalize_errors = "Hey hey, cheater, you can't pick all the best students, we need to make this fair. Look for some gpa's under 3."
    end

     return true
  end
end
