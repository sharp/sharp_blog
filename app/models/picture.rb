class Picture < ActiveRecord::Base
  attr_accessible :image, :property_id

  mount_uploader :image, ImageUploader

end
