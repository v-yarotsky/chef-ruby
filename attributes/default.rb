default[:ruby][:version]  = "2.1.0"
default[:ruby][:archive]  = "ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-#{default[:ruby][:version]}.tar.gz"
default[:ruby][:checksum] = "3538ec1f6af96ed9deb04e0965274528162726cc9ba3625dcf23648df872d09d"
default[:ruby][:file]     = File.basename(default[:ruby][:archive])
default[:ruby][:path]     = "/opt/ruby-#{default[:ruby][:version]}"
default[:ruby][:ruby]     = "#{default[:ruby][:path]}/bin/ruby"
default[:ruby][:gem_home] = "#{default[:ruby][:path]}/lib/ruby/gems/1.9"

default[:ruby][:libyaml][:version]  = "0.1.4"
default[:ruby][:libyaml][:archive]  = "http://pyyaml.org/download/libyaml/yaml-#{default[:ruby][:libyaml][:version]}.tar.gz"
default[:ruby][:libyaml][:checksum] = "36c852831d02cf90508c29852361d01b"
default[:ruby][:libyaml][:file]     = File.basename(default[:ruby][:libyaml][:archive])
default[:ruby][:libyaml][:path]     = "/opt/yaml-#{default[:ruby][:libyaml][:version]}"

default[:ruby][:rubygems][:version]  = "2.0.7"
default[:ruby][:rubygems][:archive]  = "http://production.cf.rubygems.org/rubygems/rubygems-#{default[:ruby][:rubygems][:version]}.tgz"
default[:ruby][:rubygems][:checksum] = "9046700f1222712fedfb836fafa08c50"
default[:ruby][:rubygems][:file]     = File.basename(default[:ruby][:rubygems][:archive])

