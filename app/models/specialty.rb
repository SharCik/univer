class Specialty < ActiveRecord::Base
  validates :name, presence: true 

  belongs_to :departament
  has_many :students
end
