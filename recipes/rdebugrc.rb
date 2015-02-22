inputrc_location = "#{WS_HOME}/.rdebugrc"

template inputrc_location do
  owner WS_USER
  source "rdebugrc.erb"
end
