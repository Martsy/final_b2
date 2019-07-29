# frozen_string_literal: true

class StudentCourse < ApplicationRecord
  validates_presence_of :grade
  validates :grade, presence: true, numericality: true

  belongs_to :student
  belongs_to :course

  def self.rank
    self.order(grade: :desc)
  end
end
