module ApplicationHelper
  def logged_in?
    !!session[:teacher_id]
  end

  def current_teacher
    @current = Teacher.find_by(id: session[:teacher_id]) if logged_in?
  end

  def set_teacher(teacher)
    session[:teacher_id] = teacher.id
  end

  def owner?(teacher_id)
    session[:teacher_id] == teacher_id
  end
end
