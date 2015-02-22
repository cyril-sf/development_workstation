include_recipe "pivotal_workstation::vim"
ftdetect_dir = "#{WS_HOME}/.vim/ftdetect"

unless File.exists? ftdetect_dir
  execute "make .vim/ftdetect directory" do
    command "mkdir -p '#{ftdetect_dir}'"
    user WS_USER
    not_if { File.exists? ftdetect_dir }
  end
end

template "#{WS_HOME}/.vim/ftdetect/jasmine.vim" do
  source "ftdetect/jasmine.vim.erb"
  owner WS_USER
end

template "#{WS_HOME}/.vim/ftdetect/rspec.vim" do
  source "ftdetect/rspec.vim.erb"
  owner WS_USER
end

template "#{WS_HOME}/.vim/ftdetect/qunit.vim" do
  source "ftdetect/qunit.vim.erb"
  owner WS_USER
end

