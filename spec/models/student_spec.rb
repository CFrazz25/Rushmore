require 'rails_helper'

describe Student do
  let(:student) {Student.create(first_name: "Jack", last_name: "Johnson", grade_level: 11, gender: "M", gpa: 1.73, student_id: 378)}

  it "returns student's first_name" do
    expect(student.first_name).to eq "Jack"
  end

  it "returns student's last_name" do
    expect(student.last_name).to eq "Johnson"
  end

  it "returns student's grade level" do
    expect(student.grade_level).to eq 11
  end

  it "returns student's gender" do
    expect(student.gender).to eq "M"
  end

  it "returns student's gpa" do
    expect(student.gpa).to eq 1.73
  end

  it "returns student's student_id" do
    expect(student.student_id).to eq 378
  end

  describe "student validations/requirements" do
    it "returns student's teacher's id to be nil" do
      expect(student.teacher_id).to be nil
    end

    it "doesn't allow a duplicate student_id" do
      student
      expect{ new_student = Student.create(first_name: "Jane", last_name: "Johnson", grade_level: 11, gender: "F", gpa: 3.73, student_id: 378)}.to change(Student.all, :count).by(0)
    end

    it "doesn't allow a student to be saved to database without a gpa" do
      expect{ new_student = Student.create(first_name: "Jane", last_name: "Johnson", grade_level: 11, gender: "F", student_id: 370)}.to change(Student.all, :count).by(0)
    end

    it "doesn't allow a student to be saved to database without a grade level" do
      expect{ new_student = Student.create(first_name: "Jane", last_name: "Johnson", gender: "F", gpa: 3.73, student_id: 378)}.to change(Student.all, :count).by(0)
    end
  end
end
