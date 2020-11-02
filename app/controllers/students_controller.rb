class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create 
    @student = Student.create(sc_params(:first_name, :last_name)) 
    @student.save
    redirect_to student_path(@student)
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student.update(sc_params(:title, :room_number))
    redirect_to student_path
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private

  def sc_params(*args)
    params.require(:student).permit(*args)
  end

end