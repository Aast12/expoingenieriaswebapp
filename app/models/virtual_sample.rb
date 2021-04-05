class VirtualSample < ApplicationRecord
  belongs_to :project 
  has_one_attached :icon_image, :dependent => :destroy
  has_one_attached :about_file, :dependent => :destroy
  has_many_attached :images, :dependent => :destroy
end
