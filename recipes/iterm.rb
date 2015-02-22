unless File.exists?("/Applications/iTerm.app")

  remote_file "#{Chef::Config[:file_cache_path]}/iTerm2-1_0_0_20120203.zip" do
    source node["iterm_download_uri"]
    mode "0644"
  end

  execute "unzip iterm" do
    command "unzip #{Chef::Config[:file_cache_path]}/iTerm2-1_0_0_20120203.zip  -d /Applications/"
    user WS_USER
  end
end

