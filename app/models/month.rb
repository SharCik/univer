class Month < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :semester
  has_many :omissions
  has_many :penalties
end
