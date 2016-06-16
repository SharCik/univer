class Specialty < ActiveRecord::Base
  has_one :qualification
  belongs_to :departament
end
