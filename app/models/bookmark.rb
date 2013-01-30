class Bookmark < ActiveRecord::Base
  attr_accessible :title, :body, :url, :tag_list, :slug, :published_at
  acts_as_taggable_on :tags
  
  paginates_per 30

  before_validation lambda {self.edited_at = Time.now}

end
