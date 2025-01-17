class StudentCourse < ApplicationRecord
  validates_presence_of :grade
  validates :grade, presence: true, numericality: true

  belongs_to :student
  belongs_to :course

  def self.rank
    order(grade: :desc)
  end
end
