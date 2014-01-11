include_recipe "build-essential"
include_recipe "ruby::libyaml_source"

%w(
  build-essential
  openssl
  libreadline6
  libreadline6-dev
  curl
  zlib1g
  zlib1g-dev
  libssl-dev
  libyaml-dev
  libsqlite3-dev
  sqlite3
  libxml2-dev
  libxslt-dev
  autoconf
  libc6-dev
  automake
  libtool
  bison
).each { |p| package p }

ruby = node[:ruby]
ruby_folder = File.basename(ruby[:file], ".tar.gz")
ruby_installed = "#{ruby[:ruby]} --version | grep -q '#{ruby[:version].gsub("-", "")}'"

remote_file "#{Chef::Config[:file_cache_path]}/#{ruby[:file]}" do
  source   ruby[:archive]
  checksum ruby[:checksum]
  not_if ruby_installed
end

bash "Install Ruby (MRI)" do
  user "root"
  cwd Chef::Config[:file_cache_path]
  code <<-SH
    rm -rf #{ruby_folder}
    tar xvf #{ruby[:file]}
    cd #{ruby_folder}

    export LDFLAGS="-L#{ruby[:libyaml][:path]}/lib"
    export CFLAGS="-O3 -I#{ruby[:libyaml][:path]}/include $CFLAGS"

    ./configure --enable-shared \\
                --disable-install-doc \\
                --with-out-ext=tk \\
                --with-opt-dir=#{ruby[:libyaml][:path]} \\
                --prefix=#{ruby[:path]}
    make &&  make install
  SH
  not_if ruby_installed
end

include_recipe "ruby::rubygems_source"
include_recipe "ruby::environment"

