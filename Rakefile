# Copy files in same directory to ~/
# (while ignoring dotfiles and files in ignore-array)
# Files will be overwritten except those ending in '.local',
# which will prompt for confirmation.

task :install do
  ignore = %w[README Rakefile]
  cwd = File.expand_path("../", __FILE__)
  target_dir = File.expand_path('~')

  Dir.foreach(cwd) do |file|
    unless ignore.include?(file) || file.index(/^\./)
      if file.index(/.local$/)
        puts "!!  Do you want to overwrite .#{file} (y/n) ?"
        confirm = gets.chomp
        next if confirm!='y'
      end
      cp_opts = File.directory?(file) ? '-rf' : ''

      if file=='vimrc' || file=='gvimrc'
        file_path = "#{target_dir}/." + file
      	unless File.symlink?(file_path)
          sh "ln -s ~/.vim/#{file} #{file_path}"
        end
      else
        file_path = "#{target_dir}/"
        file_path += file.index(/bin/) ? "" : "."
        file_path += file

        sh "cp #{cp_opts} #{file} #{file_path}"
      end
    end
  end
end

task :default => 'install'
