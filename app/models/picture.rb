class Picture < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
    path: ":rails_root/public/images/:id/:filename",
    url: "/images/:id/:filename",
    styles: { medium: "300x300>", thumb: "300x300>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
