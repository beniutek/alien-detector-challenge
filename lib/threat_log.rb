class ThreatLog
  def initialize(screen)
    @screen = screen[:content]
    @width = screen[:width]
    @height = screen[:height]
    @logbook = []
  end

  def log(score, starting_point)
    decorate_screen(starting_point)
    add_log("threat with score #{score} detected at #{starting_point}")
  end

  def show_log
    pp @logbook
    pp @screen
  end

  private

  THREAT_MARK = 'X'

  def decorate_screen(starting_point)
    @screen[starting_point] = THREAT_MARK
  end

  def add_log(text)
    @logbook << text
  end
end
