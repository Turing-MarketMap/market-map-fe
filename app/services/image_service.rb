class ImageService
  def self.search_images(query, dom_color)
    response = conn.get('v1', { q: query, imgColorType: 'color', imgDominantColor: dom_color, imgSize: 'LARGE', imgType: 'photo', searchType: 'image', num: 1 })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    url = 'https://customsearch.googleapis.com/customsearch/'
    Faraday.new(url: url, params: { cx: ENV['google_image_cx'], key: ENV['google_image_api_key'] })
  end
end
