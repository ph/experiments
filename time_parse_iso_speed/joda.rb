require 'benchmark'
$LOAD_PATH << File.expand_path('~/es/logstash/lib')
puts $LOAD_PATH
require 'logstash/event'
require 'logstash/timestamp'

time = Time.now.iso8601(3)
# => "2014-05-26T23:35:53.961-07:00" 

Benchmark.bm do |x|
  x.report('joda') { 100_000.times { LogStash::TimeStamp.parse_iso8601(time) } } 
end

# JRuby 1.7.12 (Stabilized after a few runs)
#        user     system      total        real
# joda  0.230000   0.000000   0.230000 (  0.222000)
