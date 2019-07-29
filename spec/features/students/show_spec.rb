# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a Visitor' do
  describe 'When I visit a student show page' do
    before :each do

      @brad = Student.create!(name: 'Brad')
      @tom = Student.create!(name: 'Tom')
      @jon = Student.create!(name: 'Jon')
      @collin = Student.create!(name: 'Collin')

      @calc = Course.create!(name: 'Calc')
      @econ = Course.create!(name: 'Econ')
      @law = Course.create!(name: 'Law')
      @psych = Course.create!(name: 'Psych')

      @brad_calc = @calc.student_courses.create!(student_id: @brad.id, grade: 85.5)
      @brad_econ = @econ.student_courses.create!(student_id: @brad.id, grade: 72.4)
      @brad_law = @law.student_courses.create!(student_id: @brad.id, grade: 92.3)

      @tom_calc = @calc.student_courses.create!(student_id: @tom.id, grade: 76.5)
      @tom_econ = @econ.student_courses.create!(student_id: @tom.id, grade: 99.1)
      @btom_psych = @psych.student_courses.create!(student_id: @tom.id, grade: 52.8)

      @jon_econ = @econ.student_courses.create!(student_id: @jon.id, grade: 71.1)
      @jon_law = @law.student_courses.create!(student_id: @jon.id, grade: 85.2)
      @jon_psych = @psych.student_courses.create!(student_id: @jon.id, grade: 68.3)

      @collin_calc = @calc.student_courses.create!(student_id: @collin.id, grade: 99.9)
      @collin_law = @law.student_courses.create!(student_id: @collin.id, grade: 84.4)
      @collin_psych = @psych.student_courses.create!(student_id: @collin.id, grade: 96.8)

      visit student_path(@brad)
    end

    it 'Displays students name' do
      expect(page).to have_content("Student Name: #{@brad.name}")
    end

    it 'Displays student courses' do
      expect(page).to have_content('Enrolled')
      expect(page).to have_content("Class: #{@brad_calc.course.name}")
      expect(page).to have_content("Grade: #{@brad_calc.grade}")
      expect(page).to have_content("Class: #{@brad_econ.course.name}")
      expect(page).to have_content("Grade: #{@brad_econ.grade}")
      expect(page).to have_content("Class: #{@brad_law.course.name}")
      expect(page).to have_content("Grade: #{@brad_law.grade}")
    end
  end
end
