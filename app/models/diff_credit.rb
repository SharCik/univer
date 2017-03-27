class DiffCredit < ActiveRecord::Base
  validates :subject, presence: true
  validates :value, presence: true 
  belongs_to :semester
end
