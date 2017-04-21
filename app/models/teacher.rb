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

    #checking grade level
    grade_level9 = students.select{ |student| student.grade_level == 9}
    grade_level10 = students.select{ |student| student.grade_level == 10}
    grade_level11 = students.select{ |student| student.grade_level == 11}
    if grade_level11.count < 3 || grade_level10.count < 3 || grade_level9.count < 3
      return "You need at least 2 selections from each grade level."
    end

    #checking gpa
   avg_gpa = students.reduce(0){|sum, student| sum + student.gpa}/students.count
    if avg_gpa < 2.5
      return  finalize_errors = "You need to choose some students with a higher gpa to make teams as even as possible. Look for some over 2.5"
    elsif avg_gpa > 3.5
      return  finalize_errors = "Hey hey, cheater, you can't pick all the best students, we need to make this fair. Look for some gpa's under 3.5"
    end

     return true

  end

  def current_teams_avg_gpa(students)
    avg_gpa = students.reduce(0){|sum, student| sum + student.gpa}/students.count
  end

  def current_males_on_team(students)
    genders = students.select{ |student| student.gender == "M"}
    return genders.count
  end

  def current_females_on_team(students)
    genders = students.select{ |student| student.gender == "F"}
    return genders.count
  end

  def current_9th_graders_on_team(students)
    grade_level9 = students.select{ |student| student.grade_level == 9}
    return grade_level9.count
  end

  def current_10th_graders_on_team(students)
    grade_level10 = students.select{ |student| student.grade_level == 10}
    return grade_level10.count
  end

  def current_11th_graders_on_team(students)
    grade_level11 = students.select{ |student| student.grade_level == 11}
    return grade_level11.count
  end


end
