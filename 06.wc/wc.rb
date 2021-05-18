# frozen_string_literal: true

require 'optparse'
option = ARGV.getopts('l')

# オプションなしを実装していく
text = $stdin.read

p lines = text.count("\n")
p word = text.split(/\s+/).size
p bytes = text.bytesize

# -lオプションの実装
if option["l"]
  p lines = text.count("\n")
end
# 引数ありのとき
# 引数に受けたファイルの改行数・単語数・バイト数とfile名をputsする

def has_argv
  total_lines = 0
  total_words = 0
  total_bytes = 0

  files = ARGV
  files.each do |file|
    content = File.read(file)
    lines = content.count("\n")
    words = content.split(/\s+/).size
    bytes = content.bytesize

    total_lines += content.count("\n")
    total_words += content.split(/\s+/).size
    total_bytes += content.bytesize

    puts "#{lines} #{words} #{bytes} #{file}"
    puts "#{total_lines} #{total_words} #{total_bytes} total"
  end
end
