Pod::Spec.new do |spec|
  spec.name = "SwiftyMorse"
  spec.version = "1.0.0"
  spec.summary = "Simple framework for translating Morse Code."
  spec.homepage = "https://github.com/mnocito/SwiftyMorse"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Marco Nocito" => 'mlnocito@gmail.com' }

  spec.platform = :ios, "9.1"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/mnocito/SwiftyMorse.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "SwiftyMorse/**/*.{h,swift}"

end
