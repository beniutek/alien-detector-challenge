class Radar
  def initialize(screen)
    @screen = screen[:content]
    @width = screen[:width]
    @height = screen[:height]
  end

  def each_frame(fwidth, fheight, &block)
    (0..pixels).each do |i|
      next if frame_exceeds_boundaries(i, fwidth, fheight)
      yield build_frame(i, fwidth, fheight)
    end
  end

  private

  def build_frame(start, fwidth, fheight)
    frame = ""

    (0..fheight).each do |i|
      new_start = start + i * @width
      stop = new_start + fwidth
      frame << "#{@screen[new_start..stop]}"
    end

    frame
  end

  def frame_exceeds_boundaries(i, fwidth, fheight)

  end

  def pixels
    @width * @height
  end

  def pick_frame(width, height)

  end
end
