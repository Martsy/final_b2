# frozen_string_literal: true

class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @course = Course.find(params[:course_id])
    @student.course = @course
    if @course.save
      flash[:success] = 'Added student to course!'
      redirect_to student_path(student)
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
