class Semester < ActiveRecord::Base
  validates :number, presence: true , uniqueness: true
  belongs_to :student
end
