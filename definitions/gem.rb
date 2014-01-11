define :ruby_gem, :version => nil do
  gem_package params[:name] do
    gem_binary "#{node[:ruby][:path]}/bin/gem"
    version params[:version] if params[:version]
    source params[:source] if params[:source]
  end
end
