class Aw < ActiveRecord::Base
  has_attached_file :uploaded_file, s3_protocol: :https, s3_permissions: :private
  validates_attachment_content_type :uploaded_file, content_type: /\Aimage\/.*\Z/

end
