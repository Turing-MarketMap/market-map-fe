class ImageFacade
  def self.search_for_listing_image(query, dom_color)
    image = ImageService.search_images(query, dom_color)
    Image.new(image[:items][0])
  end
end
