# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a Visitor' do
  describe 'When I visit the course index page' do
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

      visit courses_path
    end

    it 'Displays a rank of courses by grade' do
      expect(current_path).to eq(courses_path)

      within "#course-#{@calc.id}" do
        expect(page).to have_content(@calc.name)
        expect(page.all('h3')[0]).to have_content(@collin.name)
        expect(page.all('h3')[1]).to have_content(@brad.name)
        expect(page.all('h3')[2]).to have_content(@tom.name)
      end

      within "#course-#{@econ.id}" do
        expect(page).to have_content(@econ.name)
        expect(page.all('h3')[0]).to have_content(@tom.name)
        expect(page.all('h3')[1]).to have_content(@brad.name)
        expect(page.all('h3')[2]).to have_content(@jon.name)
      end

      within "#course-#{@law.id}" do
        expect(page).to have_content(@law.name)
        expect(page.all('h3')[0]).to have_content(@brad.name)
        expect(page.all('h3')[1]).to have_content(@jon.name)
        expect(page.all('h3')[2]).to have_content(@collin.name)
      end

      within "#course-#{@psych.id}" do
        expect(page).to have_content(@psych.name)
        expect(page.all('h3')[0]).to have_content(@collin.name)
        expect(page.all('h3')[1]).to have_content(@jon.name)
        expect(page.all('h3')[2]).to have_content(@tom.name)
      end

      within "#course-#{@psych.id}" do
        expect(page).to have_content(@psych.name)
        expect(page.all('h3')[0]).to_not have_content(@brad.name)
        expect(page.all('h3')[1]).to_not have_content(@tom.name)
        expect(page.all('h3')[2]).to_not have_content(@jon.name)
      end
    end
  end
end
