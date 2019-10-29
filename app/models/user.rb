class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         
  has_many:tweets   

  has_attached_file :avatar,# default_url: "avatar.jpg",
                      :styles => {  :large_avatar => "300x300>", 
                                    :small_avatar => "50x50>" }
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
 
  validates :username, presence: true, uniqueness: true, length: {minimum: 5}
  validates :name, presence: true
  
  acts_as_followable
  acts_as_follower
  acts_as_voter
  

  
end
