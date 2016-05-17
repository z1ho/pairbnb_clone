class Tag < ActiveRecord::Base
	belongs_to :listing

  	searchkick
end
