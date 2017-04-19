class TeachersController < ApplicationController
  def new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to teams_path
    else
      @errors = @teacher.errors.full_messages
      render :new
    end
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
    @students = @teacher.students
    render :show
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end
end
