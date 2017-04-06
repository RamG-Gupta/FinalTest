class User < ApplicationRecord
	has_secure_password
	validates_uniqueness_of :email
    validates_presence_of :email
	validates_format_of :email, with: /@/

    

    has_many :locations, dependent: :destroy 
    


    mount_uploader :image, ImageUploader
	
end
