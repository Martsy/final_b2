# frozen_string_literal: true

require 'rails_helper'

Rspec.describe Student do
  describe 'Relationships' do
    it { should have_many :student_courses }
    it { should haave_many(:courses).through(:student_courses) }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end
end
