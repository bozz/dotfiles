# Copy files in same directory to ~/
# (while ignoring dotfiles and files in ignore-array)
# Files will be overwritten except those ending in '.local',
# which will prompt for confirmation.

def copy_dotfiles
  ignore = %w[README Rakefile]
  cwd = File.expand_path("../", __FILE__)
  target_dir = File.expand_path('~')

  Dir.foreach(cwd) do |file|
    unless ignore.include?(file) || file.index(/^\./)
      if file.index(/.local|.before|.after$/) and File.exists?("#{target_dir}/.#{file}")
        #puts "!!  Do you want to overwrite .#{file} (y/n) ?"
        #confirm = gets.chomp
        next #if confirm!='y'
      end
      cp_opts = File.directory?(file) ? '-rf' : ''

      file_path = "#{target_dir}/"
      file_path += file.index(/bin/) ? "" : "."
      file_path += file

      sh "cp #{cp_opts} #{file} #{file_path}"
    end
  end
end

desc "Clone Janus (vim configs) into ~/.vim"
task :install_janus do
  sh "git clone https://github.com/carlhuda/janus.git $HOME/.vim"
end

desc "Update dotfiles"
task :update do
  puts "updating dotfiles..."
  sh "cd $HOME/.vim && rake"

  copy_dotfiles()
end

desc "Install or update dotfiles."
task :default do
  root_path = File.expand_path('~')

  unless File.directory?("#{root_path}/.vim/janus")
    puts "Found non-janus ~/.vim directory, overwrite ~/.vim, ~/.vimrc, ~/.gvimrc files? [y/n]"
    confirm = gets.chomp
    if confirm=='y'
      sh "rm -rf $HOME/.vim $HOME/.vimrc $HOME/.gvimrc"
    else
      puts "aborting..."
      exit
    end
  end

  # if ~/.vim dosn't exists then install janus
  unless File.directory?("#{root_path}/.vim")
    sh "rake install_janus"
  end

  sh "rake update"
end


