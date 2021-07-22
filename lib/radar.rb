class Radar
  def initialize(screen)
    @screen = screen[:content]
    @width = screen[:width]
    @height = screen[:height]
  end

  def each_frame(fwidth, fheight, &block)
    (0..pixels).each do |i|
      next if frame_exceeds_boundaries(i, fwidth, fheight)
      pp "i: #{i}"

      yield build_frame(i, fwidth, fheight), i
    end
  end

  private

  def build_frame(start, fwidth, fheight)
    frame = ""

    (0..(fheight-1)).each do |i|
      row_start = start + i * @width
      stop = row_start + fwidth - 1

      frame << "#{@screen[row_start..stop]}"
    end

    frame
  end

  def frame_exceeds_boundaries(i, fwidth, fheight)
    return false if i.zero?
    return false if i < @width - fwidth

    i % @width + fwidth > @width
  end

  def pixels
    @width * @height
  end
end
