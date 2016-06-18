class City < ActiveRecord::Base
  validates :name, presence: true , uniqueness: true
  has_many :universities

  mount_uploader :image_city, ImageUploader
end
