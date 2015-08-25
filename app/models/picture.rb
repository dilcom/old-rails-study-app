class Picture < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
    path: ":rails_root/public/images/:id/:filename",
    url: "/images/:id/:filename",
    styles: { medium: "800x800>", thumb: "800x800>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
