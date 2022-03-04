class ImageFacade
  def self.search_for_listing_image(query, dom_color)
    image = ImageService.search_images(query, allowed_color(dom_color))

    if image[:items]
      Image.new(image[:items][0])
    else
      default_image
    end
  end

  def self.allowed_color(dom_color)
    colors = ["BLACK", "BLUE", "BROWN", "GRAY", "GREEN", "ORANGE", "PINK", "PURPLE", "RED", "TEAL", "WHITE", "YELLOW"]

    if colors.include?(dom_color.upcase)
      dom_color
    else
      "IMG_DOMINANT_COLOR_UNDEFINED"
    end
  end

  def self.default_image
    Image.new({
      title: 'image_not_found',
      link: '/assets/broken_car_image.png',
      image: {
        height: 1254,
        width: 1880
      }
    })
  end
end
