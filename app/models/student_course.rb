class StudentCourse < ApplicationRecord
  validate_presence_of :grade, presence: true, numericality: true

  belongs_to :student
  belongs_to :course


end
