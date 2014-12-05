require 'time'
require 'benchmark'

time = Time.now.iso8601(3)
#  => "2014-05-26T23:26:08.628-07:00"

Benchmark.bm do |x|
  x.report('parse') { 100_000.times { Time.parse(time).gmtime } } 
  x.report('iso8601') { 100_000.times { Time.iso8601(time).gmtime } }
end

# MRI 2.1.2
#        user     system      total        real
# parse  2.890000   0.050000   2.940000 (  2.938882)
# iso8601  1.130000   0.010000   1.140000 (  1.144048)

# JRuby 1.7.12 (Stablized after a few runs)
#        user     system      total        real
# parse  4.810000   0.010000   4.820000 (  4.701000)
# iso8601  0.750000   0.000000   0.750000 (  0.715000)