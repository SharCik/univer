class Penalty < ActiveRecord::Base
  validates :title, presence: true
  validates :data, presence: true
  belongs_to :semester
end
