class Student < ActiveRecord::Base
  validates :username, presence: true , uniqueness: true
  validates :full_name, presence: true
  validates :birthday, presence: true
  validates :country, presence: true


  belongs_to :specialty
  has_many :semesters, dependent: :destroy 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_password

  mount_uploader :avatar, ImageUploader
end
