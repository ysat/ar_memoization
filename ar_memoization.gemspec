
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ar_memoization/version"

Gem::Specification.new do |spec|
  spec.name          = "ar_memoization"
  spec.version       = ArMemoization::VERSION
  spec.authors       = ["Yoshihiro SATO"]
  spec.email         = ["ysat.tap@gmail.com"]

  spec.summary       = %q{Memoize ActiveRecord objects and search there.}
  spec.homepage      = "https://github.com/ysat/ar_memoization"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 5.0"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.0"
end
