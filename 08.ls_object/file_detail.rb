# frozen_string_literal: true

class FileDetail
  attr_reader :file_path, :file_stat

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
    @file_path = file_path
    @file_stat = file_stat
  end

  def type
    @file_stat.directory? ? 'd' : '-'
  end

  def nlink
    @file_stat.nlink
  end

  def permission
    to_permissions(@file_stat.mode.to_s(8)[-3, 3])
  end

  def uid
    Etc.getpwuid(@file_stat.uid).name
  end

  def gid
    Etc.getgrgid(@file_stat.gid).name
  end

  def size
    @file_stat.size
  end

  def mtime
    @file_stat.mtime
  end

  def path
    @file_path
  end

  def blocks
    @file_stat.blocks
  end

  private

  def to_permissions(mode)
    mode.gsub(/[0-7]/, PERMISSIONS)
  end
end
