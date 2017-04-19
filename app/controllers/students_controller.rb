class StudentsController < ApplicationController

  def index
    @students = Student.order(:last_name)
  end


  def new
    @team = team.new
  end

  def import
    Student.import(params[:file])
    redirect_to root_url, notice: "CSV file has been imported"
  end

  def create
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
