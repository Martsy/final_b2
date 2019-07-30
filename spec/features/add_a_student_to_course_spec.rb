# frozen_string_literal: true

require 'rails_helper'

describe 'User can add student to a course' do
  scenario 'from course student new' do
    course = Course.create!(name: 'Psych')
    visit "/courses/#{course.id}/students/new"

    fill_in 'student[name]', with: 'Leonardo'
    click_button 'Create'

    expect(current_path).to eq("/students/#{student.id}")
    expect(page).to have_content('Psych')
  end
end
