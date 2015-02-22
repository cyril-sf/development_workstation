
{
  'h'  => 'help',
  'st'  => 'status',
  'dw'  => 'diff --color-words',
  'dcw' => 'diff --cached --color-words',
  'ap' => 'add --patch',
  'c' => 'checkout',
  'cm' => 'commit --amend',
  'ca' => 'commit --all',
  'cam' => 'commit --all --amend',
  'b' => 'branch',
  'br' => 'branch -r',
  'ld' => 'log --decorate',
  'lg' => 'log --stat --decorate',
  'logb' => 'log --decorate origin/master..',
  'lgb' => 'log --stat --decorate origin/master..',
  'gl' => 'log --graph --oneline --decorate',
  'fa' => 'fetch --all --prune',
  'fo' => 'fetch --prune origin',
  'rc' => 'rebase --continue',
  'wcw' => 'whatchanged -p --color-words',
  'wcwb' => 'whatchanged -p --color-words origin/master..',
  'rm-repo-only' => 'rm --cached',
  'head' => 'show --color-words HEAD',
}.each do |git_alias, cmd|
  execute "setting alias #{git_alias} to #{cmd}" do
    command %Q{git config --global alias.#{git_alias} "#{cmd}"}
    user WS_USER
  end
end

template "#{WS_HOME}/.gitignore_global" do
  source "gitignore_global.erb"
  owner WS_USER
end

execute "set core excludesfile " do
  command "git config --global core.excludesfile ~/.gitignore_global"
  user WS_USER
end

execute "set apply whitespace=nowarn" do
  command "git config --global apply.whitespace nowarn"
  user WS_USER
end

execute "set color branch=auto" do
  command "git config --global color.branch auto"
  user WS_USER
end

execute "set color diff=auto" do
  command "git config --global color.diff auto"
  user WS_USER
end

execute "set color interactive=auto" do
  command "git config --global color.interactive auto"
  user WS_USER
end

execute "set color status=auto" do
  command "git config --global color.status auto"
  user WS_USER
end

execute "set color ui=auto" do
  command "git config --global color.ui auto"
  user WS_USER
end

execute "set branch autosetuprebase=true" do
  command "git config --global branch.autosetuprebase always"
  user WS_USER
end

execute "set editor /usr/bin/vim" do
  command "git config --global core.editor /usr/bin/vim"
  user WS_USER
end
