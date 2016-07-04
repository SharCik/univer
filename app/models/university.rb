class University < ActiveRecord::Base
  validates :name, presence: true , uniqueness: true
  validates :short_name, uniqueness: true

  scope :city, -> (city_id) { where city: city_id }
  scope :ochno, -> (ochno) { where ochno: ochno }
  scope :zaochno, -> (zaochno) { where zaochno: true }
  scope :magistracy, -> (magistracy) { where magistracy: true }


  has_many :departaments, dependent: :destroy
  belongs_to :city

  mount_uploader :image, ImageUploader



end
