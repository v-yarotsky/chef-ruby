ruby = node[:ruby]

template "/etc/profile.d/ruby.sh" do
  source "profile.d/ruby.sh.erb"
  owner "root"
  group "root"
  mode  "0755"
  variables(:ruby_bin_path => File.join(ruby[:path], "bin"))
  notifies :run, "bash[reload_profile]", :immediately
end

bash "reload_profile" do
  action :nothing
  user "root"
  code <<-SH
    source /etc/profile
  SH
end

