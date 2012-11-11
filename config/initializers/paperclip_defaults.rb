# Default config for Paperclip attachment storage
Paperclip::Attachment.default_options.merge!(
    :storage => :filesystem,
    :path => ":rails_root/public/system/:rails_env/:class/:attachment/:id_partition/:style/:filename",
    :url => "/system/:rails_env/:class/:attachment/:id_partition/:style/:filename"
)