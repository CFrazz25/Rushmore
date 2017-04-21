class TeachersController < ApplicationController
  def new
  end

  def create
    @code = Code.check_code(teacher_params[:code])
    p @code
    @teacher = Teacher.new(teacher_params[:name, :email, :password])
    if @code == true
      if @teacher.save
        session[:teacher_id] = @teacher.id
        redirect_to students_path
      else
        @errors = @teacher.errors.full_messages
        render :new
      end
    else
      @errors = ["Invalid registration code."]
      render :new
    end
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
    @students = @teacher.students
    render :show
  end

  def update
    @students = Student.order(:last_name)
    @teacher = Teacher.find_by(id: params[:id])
    @teachers_students = @teacher.students
    if @teacher.finalize_draft(@teachers_students) == true
      @teachers_students.each {|student| student.update_attributes(on_finalized_team: true)}
      @finalize = "Team looks good and has been finalized, can not make anymore changes"
      render "students/index"
    else
      @finalize_errors = @teacher.finalize_draft(@teachers_students)
      render "students/index"
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :code)
  end
end
