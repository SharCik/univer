class Assessment < ActiveRecord::Base
  validates :subject, presence: true , uniqueness: true
  validates :value , presence: true
  belongs_to :semester
end
