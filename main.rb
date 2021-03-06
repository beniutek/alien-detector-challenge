require_relative 'lib/sample'
require_relative 'lib/radar'
require_relative 'lib/shape_parser'
require_relative 'lib/shape_detector'
require_relative 'lib/threat_log'

input = ARGV[0]
sample = input || Sample.get_radar_sample
crab_alien_description = Sample.get_crab_alien
squid_alien_description = Sample.get_squid_alien
parsed_sample = ShapeParser.new(sample).parse
crab_alien = ShapeParser.new(crab_alien_description).parse
squid_alien = ShapeParser.new(squid_alien_description).parse

radar = Radar.new(parsed_sample)

squid_detector = ShapeDetector.new(squid_alien, sensitivity: 70.0)
crab_detector = ShapeDetector.new(crab_alien, sensitivity: 75.0)

threat_log = ThreatLog.new(parsed_sample)

radar.each_frame(squid_alien[:width], squid_alien[:height]) do |frame, i|
  result = squid_detector.detect(frame)

  threat_log.log("squid", result[:score], i, 'S') if result[:score] > 0
end

radar.each_frame(crab_alien[:width], crab_alien[:height]) do |frame, i|
  result = crab_detector.detect(frame)

  threat_log.log("crab", result[:score], i, 'C') if result[:score] > 0
end

threat_log.show_log
