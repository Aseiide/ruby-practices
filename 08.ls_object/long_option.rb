# frozen_string_literal: true

class LongOption
  PERMISSIONS = {
    '0' => '---',
    '1' => '--x',
    '2' => '-w-',
    '3' => '-wx',
    '4' => 'r--',
    '5' => 'r-x',
    '6' => 'rw-',
    '7' => 'rwx'
  }.freeze

  def initialize(file_details)
    @file_details = file_details
  end

  def print_result
    total_file_blocks = @file_details.sum(&:blocks)
    puts "total #{total_file_blocks}"
    @file_details.each do |file_detail|
      print "#{file_detail.directory? ? 'd' : '-'}#{to_permissions(file_detail.permission)} "
      print "#{file_detail.nlink.to_s.rjust(2)} "
      print "#{file_detail.uid}  #{file_detail.gid}  "
      print "#{file_detail.size.to_s.rjust(4)} "
      print "#{file_detail.mtime.strftime('%_m %_d %H:%M')} "
      print file_detail.file_path
      puts "\n"
    end
  end

  private

  def to_permissions(mode)
    mode.gsub(/[0-7]/, PERMISSIONS)
  end
end
