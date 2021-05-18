# frozen_string_literal: true

require 'optparse'

option = ARGV.getopts('l')
@files = ARGV

total_lines = 0
total_words = 0
total_bytes = 0

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
def has_argument
  @files.each do |file|
    content = File.read(file)
    lines = content.count("\n")
    words = content.split(/\s+/).size
    bytes = content.bytesize
    puts "#{lines} #{words} #{bytes} #{file}"
  end
  puts_total if 
end

# トータルを計算する処理を切り出す
def calc_total
  total_lines += content.count("\n")
  total_words += content.split(/\s+/).size
  total_bytes += content.bytesize
end

# トータルを表示する処理
def puts_total
    puts total_lines
  if option["l"] == false
    puts total_words
    puts total_bytes
  end
end
