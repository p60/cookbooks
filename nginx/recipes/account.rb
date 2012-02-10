user node[:nginx][:user] do
  system true
  shell "/bin/false"
end
