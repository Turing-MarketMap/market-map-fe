class Image
  attr_reader :title,
              :url,
              :height,
              :width

  def initialize(data)
    @title    = data[:title]
    @url      = data[:link]
    @height   = data[:image][:height]
    @width    = data[:image][:width]
  end
end
