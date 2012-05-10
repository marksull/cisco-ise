require 'rake'
require './lib/cisco-ise.rb'

Gem::Specification.new do |s|
  s.name        = 'cisco-ise'
  s.version     = CiscoISE::Version::STRING
  s.date        = '2012-05-01'
  s.summary     = "Cisco ISE API Wrapper!"
  s.description = "A Ruby Cisco Identity Services Engine (ISE) API Wrapper"
  s.authors     = ["Mark Sullivan"]
  s.email       = 'mark@sullivans.id.au'
  s.files       = FileList['lib/**/*.rb', '[A-Z]*', 'test/**/*'].to_a
  s.homepage    = 'http://github.com/marksull/cisco-ise'
end