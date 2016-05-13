class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :dependent => :destroy
  has_many :reservations, :dependent => :destroy
  # has_many :tags #changed from tag_list
  # attr_accessible :content, :name, :tag_list
  acts_as_taggable
  mount_uploaders :image, ImageUploader
end
