include_recipe "pivotal_workstation::vim"

template "#{WS_HOME}/.vimrc.local" do
  source "vimrc.local.erb"
  owner WS_USER
end

template "#{WS_HOME}/.gvimrc.local" do
  source "gvimrc.local.erb"
  owner WS_USER
end