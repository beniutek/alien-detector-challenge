class ThreatLog
  def initialize(screen)
    @screen = screen[:content]
    @width = screen[:width]
    @height = screen[:height]
    @logbook = []
  end

  def log(text, score, starting_point, mark = 'X')
    decorate_screen(starting_point, mark.chars.first)
    add_log("#{text} threat with score #{score} detected at #{starting_point}")
  end

  def show_log
    pp @logbook
    pp @screen.chars.each_slice(@width).map(&:join)
  end

  private

  def decorate_screen(starting_point, mark)
    @screen[starting_point] = mark
  end

  def add_log(text)
    @logbook << text
  end
end
