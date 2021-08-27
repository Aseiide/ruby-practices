# frozen_string_literal: true

class FileDetail
  attr_reader :file_path, :file_stat

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
    @file_stat.mode.to_s(8)[-3, 3]
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
end
