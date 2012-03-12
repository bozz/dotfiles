# Copy files in same directory to

namespace :install do
  desc "install base pack"
  task :base do
    copy_dotfiles(:base)
  end

  desc "install common shell pack"
  task :common_shell do
    copy_dotfiles(:common_shell)
  end

  desc "install bash pack"
  task :bash => "install:common_shell" do
    copy_dotfiles(:bash)
  end

  desc "install vim pack"
  task :vim do
    copy_dotfiles(:vim)
    FileUtils.cd(root_dir + "/.vim")
    sh "ruby update_bundles"
  end

  desc "install zsh pack"
  task :zsh => "install:common_shell" do
    copy_dotfiles(:zsh)

    puts "adding  #{root_dir}/.oh-my-zsh"
    `git clone -q git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`

    # copy zsh theme
    FileUtils.cp( File.join(dotfiles_dir, "packs", "zsh", "bozz.zsh-theme"), File.join(root_dir, ".oh-my-zsh", "themes", "bozz.zsh-theme"))
  end

  desc "install task pack"
  task :task do
    copy_dotfiles(:task)

    # create ~/.task dir if doesn't exist
    task_dir = File.join(root_dir, ".task")
    unless File.directory?(task_dir)
      FileUtils.mkdir(task_dir)
    end

    # copy color theme
    puts "adding #{root_dir}/.task/solarized-dark-256.theme"
    FileUtils.cp( File.join(dotfiles_dir, "packs", "task", "solarized-dark-256.theme"), File.join(root_dir, ".task", "solarized-dark-256.theme"))
  end
end

namespace :uninstall do
  desc "uninstall base pack"
  task :base do
    remove_dotfiles(:base)
  end

  desc "uninstall common shell pack"
  task :common_shell do
    remove_dotfiles(:common_shell)
  end

  desc "uninstall bash pack"
  task :bash => "uninstall:common_shell" do
    remove_dotfiles(:bash)
  end

  desc "uninstall vim pack"
  task :vim do
    remove_dotfiles(:vim)
  end

  desc "uninstall zsh pack"
  task :zsh => "uninstall:common_shell" do
    remove_dotfiles(:zsh)
  end

  desc "uninstall task pack"
  task :task do
    remove_dotfiles(:task)
  end
end

task :default do
  puts "Select task:"
  puts `rake -T`
end


### Support Functions

def dotfiles_dir
  File.dirname(__FILE__)
end

def root_dir
  File.expand_path('~')
end

def pack_files
  {
    :base => %w[
      ackrc
      gitconfig
      jslintrc
      tmux.conf
    ],
    :common_shell => %w[
      aliases
      dircolors
    ],
    :bash => %w[
      bash_profile
      bashrc
      bash_history
    ],
    :vim => %w[
      vimrc
      vim
      viminfo
    ],
    :zsh => %w[
      zshrc
      zsh_history
      zsh-update
      oh-my-zsh
    ],
    :task => %w[
      taskrc
    ]
  }
end


def copy_dotfiles(pack)
  pack_dir = File.join(dotfiles_dir, "packs", pack.to_s)
  unless File.directory?(pack_dir)
    puts "Error: could not find pack directory: #{pack_dir}"
    exit
  end

  pack_files[pack].each do |file|
    source_file = File.join(pack_dir, file)
    if File.exists?(source_file)
      puts "adding: " + File.join(root_dir, ".#{file}")
      FileUtils.cp_r(source_file, File.join(root_dir, ".#{file}"))
    end
  end
end

def remove_dotfiles(pack)
  pack_files[pack].each do |file|
    source_file = File.join(root_dir, ".#{file}")
    if File.exists?(source_file)
      puts "removing: " + File.join(root_dir, ".#{file}")
      FileUtils.rm_rf(source_file)
    end
  end
end

