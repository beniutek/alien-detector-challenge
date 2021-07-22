class ShapeParser
  def initialize(string)
    @string = string
  end

  def parse
    {
      content: content,
      height: height,
      width: width
    }
  end

  private

  def content
    @string.gsub("\n", "")
  end

  def height
    @height ||= @string.strip.count("\n") + 1
  end

  def width
    @width ||= content.size / height
  end
end
