class University < ActiveRecord::Base
  validates :name, presence: true , uniqueness: true
  validates :univer_url, uniqueness: true
  validates :short_name, presence: true , uniqueness: true
  validates :description, presence: true 
  validates :image, presence: true 
  validates :rating, presence: true, numericality: { less_than_or_equal_to: 100,  only_integer: true } 

  scope :city, -> (city_id) { where city: city_id }
  scope :ochno, -> (ochno) { where ochno: true }
  scope :zaochno, -> (zaochno) { where zaochno: true }
  scope :magistracy, -> (magistracy) { where magistracy: true }
  scope :preparatory_department, -> (preparatory_department) { where preparatory_department: true }
  scope :hostel, -> (hostel) { where hostel: true }

  has_many :departaments, dependent: :destroy
  belongs_to :city

  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :univer_url, use: [:slugged, :finders]

  def slug_candidates
    [:univer_url, [:univer_url, :id]]
  end

  def self.search(search)
    where("name ILIKE ? OR short_name ILIKE ?", "%#{search}%", "%#{search}%")
  end

  private

    def should_generate_new_friendly_id?
      univer_url_changed?
    end


end
