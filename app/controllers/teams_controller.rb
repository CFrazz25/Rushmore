class TeamsController < ApplicationController
  def index
    @teacher = Teacher.find_by(id: params[:id])
    @students = @teacher.students.all
  end

  def update
    @teacher = Teacher.find_by(id: params[:id])
    @student = Student.find_by(id: params[:id])
    if @teacher.students.count < 12
      @student.update_attributes(teacher_id: @teacher.id)
      redirect_to @teacher
    else
      @draft_error = "Can't have more than 12 students on a team"
      redirect_to students_path
    end
  end

  def destroy
    @teacher = Teacher.find_by(id: params[:id])
    @student = Student.find_by(id: params[:id])
    @student.update_attributes(teacher_id: nil)
      redirect_to @teacher
  end
end
