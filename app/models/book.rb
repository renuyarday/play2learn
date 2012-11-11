class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :title, :type => String
  field :summary, :type => String
  field :link, :type => String

  has_mongoid_attached_file :cover_image

  validates_presence_of :title, :link
  validates :cover_image, :attachment_presence => true
end