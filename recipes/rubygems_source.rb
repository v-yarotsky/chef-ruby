ruby = node[:ruby]
rubygems = node[:ruby][:rubygems]
rubygems_folder = File.basename(rubygems[:file], ".tgz")

remote_file "#{Chef::Config[:file_cache_path]}/#{rubygems[:file]}" do
  source   rubygems[:archive]
  checksum rubygems[:checksum]
end

bash "Install rubygems" do
  user "root"
  cwd Chef::Config[:file_cache_path]
  code <<-SH
    rm -rf #{rubygems_folder}
    tar xvf #{rubygems[:file]}
    cd #{rubygems_folder}
    #{ruby[:ruby]} setup.rb
  SH
  not_if "#{ruby[:path]}/bin/gem --version | grep -q '#{rubygems[:version]}'"
end

