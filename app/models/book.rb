class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Paranoia

  field :title, :type => String
  field :author, :type => String
  field :summary, :type => String
  field :link, :type => String

  has_mongoid_attached_file :cover_image

  has_and_belongs_to_many :categories

  validates_presence_of :title, :author, :link
  validates :cover_image, :attachment_presence => true
  validates :categories, :presence => { :message => "At least one category must be selected" }
end