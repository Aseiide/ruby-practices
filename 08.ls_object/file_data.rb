# frozen_string_literal: true

class FileData
  attr_reader :type, :permission, :nlink, :uid, :gid, :size, :mtime, :path, :blocks

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

  def initialize(file_path, file_stat)
    @type = file_stat.directory? ? 'd' : '-'
    @nlink = file_stat.nlink
    @permission = file_stat.mode.to_s(8)[-3, 3].chars
    @uid = Etc.getpwuid(file_stat.uid).name
    @gid = Etc.getgrgid(file_stat.gid).name
    @size = file_stat.size
    @mtime = file_stat.mtime.strftime('%_m %_d %H:%M')
    @path = file_path
    @blocks = file_stat.blocks
  end
end
