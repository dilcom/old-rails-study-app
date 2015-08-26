class Picture < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
    styles: { medium: "800x800>", thumb: "200x150#" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
