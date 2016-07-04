class New < ActiveRecord::Base
  validates :name, presence: true
  validates :short_description, presence: true
  validates :description, presence: true
  validates :news_image, presence: true  

  mount_uploader :news_image, ImageUploader
end
