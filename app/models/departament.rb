class Departament < ActiveRecord::Base
  has_many :specialties, dependent: :destroy 
  has_many :magistracies, dependent: :destroy
  belongs_to :university
end
