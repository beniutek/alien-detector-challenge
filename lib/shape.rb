class Shape
  attr_reader :height, :width

  def initialize(shape)
    @shape = shape
    @height = shape.size
    @width = shape.first.size
  end

  def compare(sample)
  end

  def [](index)
    @shape[:content][index]
  end
end
