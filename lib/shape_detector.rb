class ShapeDetector
  def initialize(shape, sensitivity: 50.0)
    @shape = shape[:content]
    @width = shape[:width]
    @height = shape[:height]
    @sensitivity = sensitivity
  end

  def detect(frame)
    return no_detection_result if frame.size != @shape.size

    score = 0

    frame.chars.each_with_index do |char, i|
      score += 1 if char == @shape[i]
    end

    outcome = (score / total_shape_area) * 100

    signal_detection?(outcome) ? { score: outcome, frame: frame } : no_detection_result
  end

  private

  def signal_detection?(outcome)
    outcome > @sensitivity
  end

  def total_shape_area
    (@height * @width).to_f
  end

  def no_detection_result
    { score: 0, frame: nil }
  end
end
