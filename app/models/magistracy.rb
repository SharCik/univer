class Magistracy < ActiveRecord::Base
  validates :name, presence: true 

  belongs_to :departament
end
