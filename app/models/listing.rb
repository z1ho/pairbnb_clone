require 'elasticsearch/model'

class Listing < ActiveRecord::Base

  belongs_to :user
  has_many :tags, :dependent => :destroy
  has_many :reservations, :dependent => :destroy

  acts_as_taggable
  mount_uploaders :image, ImageUploader
  # added by ZWH 9-JUL-16
  mount_uploader :avatar, AvatarUploader 

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
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

end

#to autosync model with elasticsearch
Listing.import force: true