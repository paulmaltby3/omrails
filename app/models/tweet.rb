class Tweet < ApplicationRecord
  belongs_to :user
  
  validates :user, presence: true
  validates :content, presence: true, length: { maximum: 172 }
  
  acts_as_votable
  
  has_attached_file :image, source_file_options { all: '-auto-orient' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
