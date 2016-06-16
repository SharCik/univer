class Departament < ActiveRecord::Base
  has_many :specialties
  belongs_to :university
end
