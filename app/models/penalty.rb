class Penalty < ActiveRecord::Base
  validates :title, presence: true , uniqueness: true
  validates :data, presence: true
  belongs_to :month
end
