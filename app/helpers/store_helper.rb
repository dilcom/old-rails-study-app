module StoreHelper
  MAX_DESCRIPTION_LENGTH_FOR_VIEW = 300

  def short_description(product)
    raw(truncate_html(product.description, length: MAX_DESCRIPTION_LENGTH_FOR_VIEW))
  end

  def fancy_product_tag(product)
    image_url = if product.pictures.any?
      product.pictures.first.image.url
    else
      DEFAULT_IMAGE_URL
    end
    image_tag(image_url, class: 'img-responsive')
  end
end
