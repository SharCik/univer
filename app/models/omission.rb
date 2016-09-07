class Omission < ActiveRecord::Base
  validates :hours, presence: true 
  belongs_to :month
end
