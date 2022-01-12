lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'render_table/version'

Gem::Specification.new do |spec|
  spec.name          = 'render_table'
  spec.version       = RenderTable::VERSION
  spec.authors       = ['Manuel Morales', 'Mary Kniffin', 'Leo Policastro']
  spec.email         = ['emau757@gmail.com']

  spec.summary       = 'Extensible ruby html table building classes.'
  spec.homepage      = 'https://github.com/galacticplastic/render_table'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.3.4'
  spec.add_development_dependency 'rake', '~> 13.0.6'
  spec.add_development_dependency 'rspec', '~> 3.10.0'
end
