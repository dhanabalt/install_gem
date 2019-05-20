# frozen_string_literal: true

module InstallGemLocal
  module RemoveGem
    def remove_gem
      file_exists = file_names
      if file_exists.count > 1
        remove_file_from_path(multiple_version_selection(include_all: true))
      elsif file_exists.count == 1
        remove_file_from_path(file_exists.first)
      else
        ap 'Gem not exist'
      end
    end

    def remove_file_from_path(file_name)
      return if file_name == 'exit'

      if file_name == 'all'
        tty_command.run('rm *.gem')
      else
        tty_command.run("rm #{file_name}")
      end
    end
  end
end