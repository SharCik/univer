class Semester < ActiveRecord::Base
  validates :number, presence: true , uniqueness: true
  belongs_to :student
  has_many :assessments
  has_many :credits
  has_many :diff_credits
  has_many :months
  has_many :penalties
end
