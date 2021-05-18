# frozen_string_literal: true

require 'optparse'
option = ARGV.getopts('l')


# オプションなしを実装していく
text = $stdin.read

p text.count("\n")
p word = text.split(/\s+/).size
p text.bytesize

# 引数ありのとき
# 引数に受けたファイルの改行数・単語数・バイト数とfile名をputsする
files = ARGV
files.each do |file|
  content = File.read(file)
  lines = content.count("\n")
  words = content.split(/\s+/).size
  bytes = content.bytesize
  puts "#{lines} #{words} #{bytes} #{file}"
end
