include_recipe "build-essential"

case node[:platform]
when "debian", "ubuntu"
  package "uuid-dev"
else
  package "libuuid-devel"
end

zeromq_tar = "zeromq-#{node[:zeromq][:version]}.tar.gz"

remote_file "/usr/local/src/#{zeromq_tar}" do
  source "http://download.zeromq.org/#{zeromq_tar}"
  checksum node[:zeromq][:checksum]
  mode 0644
end

# --no-same-owner required overcome "Cannot change ownership" bug
# on NFS-mounted filesystem
execute "tar --no-same-owner -zxf #{zeromq_tar}" do
  cwd "/usr/local/src"
  creates "/usr/local/src/zeromq-#{node[:zeromq][:version]}"
end

bash "compile zeromq" do
  cwd "/usr/local/src/zeromq-#{node[:zeromq][:version]}"
  code <<-EOH
    ./configure --prefix=#{node[:zeromq][:dir]} && \
    make
  EOH
  creates "/usr/local/src/zeromq-#{node[:zeromq][:version]}/node"
end

execute "make install" do
  cwd "/usr/local/src/zeromq-#{node[:zeromq][:version]}"
end
