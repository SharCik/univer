class Student < ActiveRecord::Base
  validates :username, presence: true , uniqueness: true
  validates :full_name, presence: true
  belongs_to :specialty
  has_many :semesters, dependent: :destroy 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable,
         :authentication_keys => [:username]


  mount_uploader :avatar, ImageUploader

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
