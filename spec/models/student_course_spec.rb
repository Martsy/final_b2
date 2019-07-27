# frozen_string_literal: true

require 'rails_helper'

Rspec.describe SudentCourse do
  describe 'Relationships' do
    it { should belong_to :student }
    it { should belong_to :course }
  end

  describe 'Validations' do
    it { should validate_presence_of :grade }
    it { should validate_numericality_of :grade }
  end
end