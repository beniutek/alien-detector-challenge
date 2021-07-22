require_relative 'lib/sample'
require_relative 'lib/radar'
require_relative 'lib/shape_parser'
require_relative 'lib/shape_detector'

sample = Sample.get_radar_sample
crab_alien_description = Sample.get_crab_alien
squid_alien_description = Sample.get_squid_alien
parsed_sample = ShapeParser.new(sample).parse
crab_alien = ShapeParser.new(crab_alien_description).parse
squid_alien = ShapeParser.new(squid_alien_description).parse

radar = Radar.new(parsed_sample)

squid_detector = ShapeDetector.new(squid_alien)
crab_detector = ShapeDetector.new(crab_alien)

results = []
pp squid_alien
radar.each_frame(squid_alien[:width], squid_alien[:height]) do |frame|
  pp frame.chars.each_slice(squid_alien[:width]).map(&:join)
  # pp squid_detector.detect(frame).to_s + "\% chance"

  result = squid_detector.detect(frame)

  if result[:score] > 0
    pp "adding to results"
    results << result
  end
end

pp results
