class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :dependent => :destroy
  has_many :reservations, :dependent => :destroy
  # has_many :tags #changed from tag_list
  # attr_accessible :content, :name, :tag_list
  acts_as_taggable
  mount_uploaders :image, ImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :room_type, presence: true
  validates :property_type, presence: true
  validates :accomodates, presence: true
  validates :num_of_beds, presence: true
  validates :num_of_bathrooms, presence: true
  validates :price, presence: true

  searchkick
  
end
