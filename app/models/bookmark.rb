class Bookmark < ActiveRecord::Base
  attr_accessible :title, :body, :url
  acts_as_taggable_on :tags
  
  paginates_per 30
end
