template node[:unicorn_site][:definition_path] do
  source "nginx.erb"
  owner "root"
  group "root"
  mode 0644
end
