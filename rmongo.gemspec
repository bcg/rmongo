Gem::Specification.new do |s|
  s.name = %q{rmongo}
  s.version = "0.1.0"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aman Gupta"]
  s.date = %q{2010-03-11}
  s.description = %q{An EventMachine[http://rubyeventmachine.com/] based library for interacting with the very cool Redis[http://code.google.com/p/redis/] data store by Salvatore 'antirez' Sanfilippo. Modeled after eventmachine's implementation of the memcached protocol, and influenced by Ezra Zygmuntowicz's {redis-rb}[http://github.com/ezmobius/redis-rb/tree/master] library (distributed as part of Redis).  This library is only useful when used as part of an application that relies on Event Machine's event loop.  It implements an EM-based client protocol, which leverages the non-blocking nature of the EM interface to acheive significant parallelization without threads.  WARNING: this library is my first attempt to write an evented client protocol, and isn't currently used in production anywhere.  All that bit in the license about not being warranted to work for any particular purpose really applies.}
  s.email = %q{aman@tmm1.net}
  s.files = ["TODO", "README", "rmongo.gemspec", "Rakefile", 
             "lib/mongo.rb"] + Dir['lib/mongo/*'] + Dir['lib/ext/*']
  s.has_rdoc = false
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{An EventMachine MongoDB client}
 
end

