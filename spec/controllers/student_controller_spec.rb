require 'rails_helper'

describe StudentsController do

  let(:student) { Student.create(first_name: "Jack", last_name: "Johnson", grade_level: 11, gender: "M", gpa: 1.73, student_id: 378) }

  describe "GET #index" do
     it "responds with status code 200" do
      get :index
      (expect(response.status).to eq(200))
    end
    it "assigns the students in order by last name" do
        students = [Student.create(first_name: "Jack", last_name: "Johnson", grade_level: 11, gender: "M", gpa: 1.73, student_id: 378), Student.create(first_name: "Ja", last_name: "Zack", grade_level: 11, gender: "M", gpa: 1.73, student_id: 379), Student.create(first_name: "Jack", last_name: "Walters", grade_level: 11, gender: "M", gpa: 1.73, student_id: 300)]
      get :index
      expect(assigns(:students)).to eq(Student.order(:last_name))
    end

     it "renders the :index template" do
       get :index
       expect(response).to render_template(:index)
     end
  end

  describe "POST #import" do
    it "redirects to the students page" do
      allow(Student).to receive(:import).with("students.csv")
      post :import, file: "students.csv"
      expect(response).to redirect_to students_path
    end

    it "adds a flash notice" do
      allow(Student).to receive(:import).with("students.csv")
      post :import, file: "students.csv"
      expect(flash[:notice]).to eq "Students have been uploaded!"
    end

    it "imports the file" do
      expect(Student).to receive(:import).with("students.csv")
      post :import, file: "students.csv"
    end


  end

  describe "PUT #update" do
     it "assigns student in the form" do
      teacher = Teacher.create(name: "chris", email: "chris@gmail.com", password: "poop")
      session[:teacher_id] = teacher.id
      student
      patch :update, {id: student.id }
       expect(assigns(:student)).to eq(teacher.students.last)
     end

     #  it "assigns a new game to @game" do
     #    get :new
     #    expect(assigns(:game)).to be_a_new Game
     #  end

     # it "renders the :new template" do
     #   get :new
     #   expect(response).to render_template(:new)
     # end
    end
end

