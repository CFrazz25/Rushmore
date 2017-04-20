class SessionsController < ApplicationController
  def new
  end

  def create
    @teacher = Teacher.authenticate(session_params[:email], session_params[:password])
    if @teacher
      session[:teacher_id] = @teacher.id
      redirect_to students_path
    else
      @errors = ["That teacher does not exist."]
      render :new
    end
  end

  def destroy
    session.delete(:teacher_id)
    redirect_to :root
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
