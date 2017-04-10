class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  validates_length_of   :email, :minimum => 4, :maximum => 30, :message => "Email should contains maximum 20 Character"
    validates_format_of  :email, :with => /\A[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i   
  validates_length_of :encrypted_password, :minimum => 4, :maximum => 16, :allow_blank => true 
    validates :encrypted_password, format: {with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./, message: "must include at least one lowercase letter, one uppercase letter, and one digit"}       
end
