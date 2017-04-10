class User < ApplicationRecord
	has_secure_password
	validates_uniqueness_of :email
    #validates_presence_of :email
	#validates_format_of :email, with: /@/
    #validates_format_of :first_name, with: /^[-a-z]+$/
    #validates_format_of :last_name, with: /^[-a-z]+$/
   

    validates_length_of   :email, :minimum => 4, :maximum => 30, :message => "Email should contains maximum 30 Character"
    validates_format_of  :email, :with => /\A[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i 



    #validates_format_of :first_name, :with => /\A[a-zA-Z]+\z/
    #validates_length_of :first_name, :minimum => 4, :maximum => 20, :message => "First name Should contains maximum 15 character"
    #validates_format_of :first_name, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain special character and numbers, or .-_@"
    
    #validates_format_of :last_name, :with => /\A[a-zA-Z]+\z/
    #validates_length_of :last_name, :minimum => 4, :maximum => 20, :message => "Last name Should contains maximum 15 character"
    #validates_length_of :last_name, :maximum => 15, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain special character and numbers, or .-_@"

    #validates_length_of :password, :minimum => 4, :maximum => 20, :allow_blank => true 
    #validates :password, format: {with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./, message: "must include at least one lowercase letter, one uppercase letter, and one digit"}

    #validates_format_of :dob, :allow_blank => true, :message => "Email should be 30 Character"

    #validates_length_of :user_role, :minimum => 2, :maximum => 6, :message => "Field is Rquired"
    

    has_many :locations, dependent: :destroy 
    
     
  
    mount_uploader :image, ImageUploader
	
end
