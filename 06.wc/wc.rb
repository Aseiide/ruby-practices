# frozen_string_literal: true

require 'optparse'

option = ARGV.getopts('l')
@files = ARGV

# text = $stdin.read
# p lines = text.count("\n")
# p word = text.split(/\s+/).size
# p bytes = text.bytesize
 
# -lオプションの実装
# 改行数だけを出力
def l_option
  @files.each do |file|
    content = File.read(file)
    puts content.count("\n")
  end
end

# 引数がなかった時
# 標準入力して改行数、単語数、バイト数、ファイル名を出力
def non_argument
  text = $stdin.read
  lines = text.count("\n")
  words = text.split(/\s+/).size
  bytes = text.bytesize
  puts "#{lines} #{words} #{bytes}"
end

# 引数ありの処理
total_lines = 0
total_words = 0
total_bytes = 0

def has_argument
  @files.each do |file|
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

if option['l'] == true
  l_option
else
  non_argument
end

if 
end
