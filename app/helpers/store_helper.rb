module StoreHelper
  DEFAULT_IMAGE_URL = '/images/no-image.jpg'
  DEFAULT_THUMB_IMAGE_URL = '/images/no-image-thumb.jpg'

  def fancy_product_tag(product)
    image_url = if product.pictures.any?
      product.pictures.first.image.url(:thumb)
    else
      DEFAULT_THUMB_IMAGE_URL
    end
    image_tag(image_url, class: 'img-responsive')
  end
end
