class University < ActiveRecord::Base
  validates :name, presence: true , uniqueness: true
  validates :short_name, uniqueness: true

  scope :city, -> (city_id) { where city: city_id }
  scope :ochno, -> (ochno) { where ochno: true }
  scope :zaochno, -> (zaochno) { where zaochno: true }
  scope :magistracy, -> (magistracy) { where magistracy: true }
  scope :preparatory_department, -> (preparatory_department) { where preparatory_department: true }
  scope :hostel, -> (hostel) { where hostel: true }

  has_many :departaments, dependent: :destroy
  belongs_to :city

  mount_uploader :image, ImageUploader

  def self.search(search)
    where("name ILIKE ? OR short_name ILIKE ?", "%#{search}%", "%#{search}%")
  end



end
