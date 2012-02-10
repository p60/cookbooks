include_recipe "build-essential"

kyotocabinet_tar = "kyotocabinet-#{node[:kyotocabinet][:version]}.tar.gz"

remote_file "/usr/local/src/#{kyotocabinet_tar}" do
  source "http://fallabs.com/kyotocabinet/pkg/#{kyotocabinet_tar}"
  checksum node[:kyotocabinet][:checksum]
  mode 0644
end

# --no-same-owner required overcome "Cannot change ownership" bug
# on NFS-mounted filesystem
execute "tar --no-same-owner -zxf #{kyotocabinet_tar}" do
  cwd "/usr/local/src"
  creates "/usr/local/src/kyotocabinet-#{node[:kyotocabinet][:version]}"
end

bash "compile kyotocabinet" do
  cwd "/usr/local/src/kyotocabinet-#{node[:kyotocabinet][:version]}"
  code <<-EOH
    ./configure --prefix=#{node[:kyotocabinet][:dir]} && \
    make
  EOH
  creates "/usr/local/src/kyotocabinet-#{node[:kyotocabinet][:version]}/node"
end

execute "make install" do
  cwd "/usr/local/src/kyotocabinet-#{node[:kyotocabinet][:version]}"
end
