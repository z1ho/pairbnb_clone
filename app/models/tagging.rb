require 'elasticsearch/model'

class Tagging < ActiveRecord::Base
	
  belongs_to :tag
  belongs_to :listing
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

end

#to autosync model with elasticsearch
Tagging.import force: true