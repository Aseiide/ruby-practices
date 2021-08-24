# frozen_string_literal: true

require 'optparse'
require 'etc'

class Command
  def initialize(a_option: false, l_option: false, r_option: false)
    @a_option = a_option
    @l_option = l_option
    @r_option = r_option
  end

  def output
    file_paths = @a_option ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
    sorted_file_paths = @r_option ? file_paths.reverse : file_paths.sort
    file_details = sorted_file_paths.map do |file_path|
      FileData.new(file_path, File::Stat.new(file_path))
    end
    formatter = @l_option ? LongOption.new(file_details) : ShortOption.new(file_details)
    formatter.print_result
  end
end
