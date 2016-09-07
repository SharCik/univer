class Credit < ActiveRecord::Base
  validates :subject, presence: true , uniqueness: true
  belongs_to :semester
end
