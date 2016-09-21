Gem::Specification.new do |s|
  
  s.name        = 'wob'
  s.version     = '0.0.1'
  s.date        = '2016-09-21'
  s.summary     = 'Way of burrito'
  s.description = 'A sample gem for wrapping data'
  
  s.authors     = [
    'Xavier Van de Woestyne'
  ]
  
  s.email       = 'xaviervdw@gmail.com'
  
  s.files       = [
    'lib/wob.rb',
    'lib/wob/behaviours.rb',
    'lib/wob/nondeterminist.rb',
    'lib/wob/error.rb',
    'lib/wob/concurrency.rb'
  ]
  s.homepage    = 'http://xvw.github.io'
  s.license     = 'GPL-3.0'

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

end
