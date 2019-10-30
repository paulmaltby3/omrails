class Tweet < ApplicationRecord
  belongs_to :user
  
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 172 }
  
  acts_as_votable
  
  #convert_options currently being tested https://stackoverflow.com/questions/1041884/iphone-camera-images-are-rotated-when-uploaded-to-web
  has_attached_file :image, 
                    #:convert_options => { :all => '-auto-orient' }
                    :source_file_options =>  {:all => '-auto-orient'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
