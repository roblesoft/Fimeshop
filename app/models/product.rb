class Product < ApplicationRecord
	mount_uploader :picture, PictureUploader
	validates :name, :description, presence: true
	belongs_to :user
end
