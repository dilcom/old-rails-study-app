module AdminArea::PicturesHelper
  def fancy_image_tag(image)
    link_to image_tag(image.url(:thumb)), image.url(:medium), class: "thumbnail"
  end
end
