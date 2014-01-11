libyaml = node[:ruby][:libyaml]
libyaml_folder = File.basename(libyaml[:file], ".tar.gz")

libyaml_installed = proc { File.exists?(File.join(libyaml[:path], "lib", "libyaml.so")) }

remote_file "#{Chef::Config[:file_cache_path]}/#{libyaml[:file]}" do
  source   libyaml[:archive]
  checksum libyaml[:checksum]
  not_if &libyaml_installed
end

bash "Install libyaml" do
  user "root"
  cwd Chef::Config[:file_cache_path]
  code <<-SH
    rm -rf #{libyaml_folder}
    tar xvf #{libyaml[:file]}
    cd #{libyaml_folder}
    ./configure --prefix=#{libyaml[:path]}
    make &&  make install
  SH
  not_if &libyaml_installed
end

