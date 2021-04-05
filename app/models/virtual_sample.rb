class VirtualSample < ApplicationRecord
  belongs_to :project 
  has_one_attached :icon_image, :dependent => :destroy
end
