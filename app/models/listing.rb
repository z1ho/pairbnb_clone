class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :tag_list
  # attr_accessible :content, :name, :tag_list
  acts_as_taggable
end
