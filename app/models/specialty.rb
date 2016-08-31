class Specialty < ActiveRecord::Base
  has_many :students
  belongs_to :departament
end
