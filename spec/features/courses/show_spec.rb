require 'rails_helper'

describe 'As a Visitor' do
  describe 'I visit a course show page and see' do
    scenario 'a form to enroll a student' do
      student = Student.create(name: 'Vincent Gallo')
      course = student.courses.create(name: 'Acting')

      visit student_path(student)

      expect(page).to have_content(course.name)
    end
  end
end
