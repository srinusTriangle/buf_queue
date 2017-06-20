# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "buf_queue/version"

Gem::Specification.new do |spec|
  spec.name          = "buf_queue"
  spec.version       = BufQueue::VERSION
  spec.authors       = ["Srinivas Lavudya"]
  spec.email         = ["srinusonly@gmail.com"]

  spec.summary       = %q{ A pub-sub problem with Observer design pattern by using buffered 
                           queue with some constraints}
  spec.description   = %q{ Buffered Queue which flush the data when the queue max size has 
                           reached and all other subscribers which are listening to}
  spec.homepage      = "https://github.com/srinusTriangle/bq"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
