# Copy files in same directory to ~/
# (while ignoring dotfiles and files in ignore-array)
# Files will be overwritten except those ending in '.local',
# which will prompt for confirmation.

task :install do
  ignore = %w[README Rakefile]
  cwd = File.expand_path("../", __FILE__)
  target_dir = '~'

  Dir.foreach(cwd) do |file|
    unless ignore.include?(file) || file.index(/^\./)
      if file.index(/.local$/)
        puts "!!  Do you want to overwrite .#{file} (y/n) ?"
        confirm = gets.chomp
        next if confirm!='y'
      end
      cp_opts = File.directory?(file) ? '-rf' : ''

      if file=='vimrc' || file=='gvimrc'
	sh "rm ~/.#{file}"
        sh "ln -s ~/.vim/#{file} ~/.#{file}"
      else
        sh "cp #{cp_opts} #{file} #{target_dir}/.#{file}"
      end
    end
  end
end

task :default => 'install'
