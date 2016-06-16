class University < ActiveRecord::Base
  validates :name, presence: true , uniqueness: true
  validates :short_name, uniqueness: true

  has_many :departaments

  mount_uploader :image, ImageUploader
end
