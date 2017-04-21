class StudentsController < ApplicationController

  def index
    @students = Student.all.select{|student| student.gpa >= 2.0}
    @ineligible_students = Student.all.select{|student| student.gpa < 2.0}
   @students_by_last_name = @students.sort_by{|student| student.last_name}
   @students_by_gpa = @students.sort_by{|student| student.gpa}
   @students_by_grade_level = @students.sort_by{|student| student.grade_level}
    @teacher = Teacher.find_by(id: session[:teacher_id])

  end


  # def new
  #  currently do not have features to create individual students, only by csv uploads
  # end

  def import
    Student.import(params[:file])
    flash[:notice] = "Students have been uploaded!"
    redirect_to students_path
  end

  # def create
  #  currently do not have features to create individual students, only by csv uploads
  # end

   def update
    if params[:commit] == "Draft"
      @students = Student.order(:last_name)
      @teacher = Teacher.find_by(id: session[:teacher_id])
      @student = Student.find_by(id: params[:id])
      if @teacher.students.count < 12
        @student.update_attributes(teacher_id: @teacher.id)
        redirect_to students_path
      else
        @draft_error = "Can't have more than 12 students on a team"
        render :index
      end
    elsif params[:commit] == "Drop from Team"
      @student = Student.find_by(id: params[:id])
      @student.update_attributes(teacher_id: nil)
      @teacher = Teacher.find_by(id: session[:teacher_id])
        redirect_to students_path
    end
  end

  def destroy
    # student = student.find(params[:id])
    # student.destroy
    # redirect_to teams_url
  end

  private
  def game_params
    # params.require(:team).permit(:user_throw)
  end
end
