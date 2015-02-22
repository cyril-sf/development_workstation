::RVM_HOME = "#{WS_HOME}/.rvm"
::RVM_COMMAND = "#{::RVM_HOME}/bin/rvm"

if( File.exists?( ::RVM_COMMAND ) )
  execute "update rvm" do
    command "#{::RVM_COMMAND} get stable"
    user WS_USER
  end
else
  recursive_directories [RVM_HOME, 'src', 'rvm'] do
    owner WS_USER
    recursive true
  end

  [
    "curl -L https://get.rvm.io | bash -s stable --ruby",
    "#{RVM_COMMAND} --version | grep Wayne"
  ].each do |rvm_cmd|
    execute rvm_cmd do
      user WS_USER
    end
  end

  %w{readline autoconf openssl zlib}.each do |rvm_pkg|
    execute "install rvm pkg: #{rvm_pkg}" do
      command "#{::RVM_COMMAND} pkg install --verify-downloads 1 #{rvm_pkg}"
      user WS_USER
    end
  end
end

node["rvm"]["rubies"].each do |version, options|
  rvm_ruby_install version do
    options options
  end
end

execute "making #{node["rvm"]["default_ruby"]} with rvm the default" do
  not_if { node["rvm"]["default_ruby"].nil? }
  command "#{::RVM_COMMAND} alias create default #{node["rvm"]["default_ruby"]}"
  user WS_USER
end
