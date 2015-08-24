module ApplicationHelper
  DEFAULT_IMAGE_URL = '/images/home/1.jpg'
  def fancy_image_tag(img_url)
    link_to(
      image_tag(img_url, class: 'img-responsive'),
      img_url,
      class: 'thumbnail'
    )
  end

  def currency(number)
  	number_to_currency(number, precision: 2, unit: '$')
  end
end
