class Credit < ActiveRecord::Base
  validates :subject, presence: true 
  belongs_to :semester
end
