class User < ApplicationRecord
	has_secure_password
	validates_uniqueness_of :email




    has_many :locations, dependent: :destroy 
    mount_uploader :image, ImageUploader
	
end
