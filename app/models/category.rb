class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :name, :type => String
  has_mongoid_attached_file :badge_image

  validates_presence_of :name
  validates :badge_image, :attachment_presence => true
end