require 'elasticsearch/model'

class Tag < ActiveRecord::Base

	belongs_to :listing
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

end

#to autosync model with elasticsearch
Tag.import force: true
