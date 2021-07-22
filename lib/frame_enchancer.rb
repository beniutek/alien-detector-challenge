class FrameEnchancer
  def initialize(reference)
    @reference = reference[:content]
    @width = reference[:width]
    @height = reference[:height]
  end

#  "o--ooo--",
#  "ooooo-oo",
#  "oooo-oo-",
#  "oo---o-o",
#  "o-o-oo--",
#  "--o--ooo",
#  "oo-o---o",
#  "--o--o--",
#  "-------o",
#  "--------",

#  "---oo---",
#  "--oooo--",
#  "-oooooo-",
#  "oo-oo-oo",
#  "oooooooo",
#  "--o--o--",
#  "-o-oo-o-",
#  "o-o--o-o",


  def enchance(frame)
    (0..@height).each do |i|
      start = i * @width
      stop = new_start + @width
      "#{@reference[start..stop]}"
    end
  end

  def enchance_row(row)

  end
end
