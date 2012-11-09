class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :name, :type => String
  #field :badge_image_url, :type => String, :default => "http://i420.photobucket.com/albums/pp282/jerrad_09/icon_badge.gif"
  has_mongoid_attached_file :badge_image
end