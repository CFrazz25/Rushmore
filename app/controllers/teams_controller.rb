class TeamsController < ApplicationController
  def index
    @students = Student.all
  end


  def new
    @team = team.new
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
