Gem::Specification.new do |s|
  s.name        = 'activesupport-database_store'
  s.version     = '0.0.1'
  s.summary     = ''

  s.author      = ''

  s.files        = Dir['README.md', 'lib/**/*']
  s.require_path = 'lib'

  s.add_dependency('activerecord', '>= 5.0')
  s.add_dependency('activesupport', '>= 5.0')
end
