# frozen_string_literal: true

require 'optparse'

@option = ARGV.getopts('l')
@files = ARGV

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
    @contents = File.read(file)
    @lines = @contents.count("\n")
    @words = @contents.split(/\s+/).size
    @bytes = @contents.bytesize
    puts "#{@lines} #{@words} #{@bytes} #{@file}"
  end
  display_total
end

# トータルを計算する処理を切り出す
def calc_total
  @total_lines = 0
  @total_words = 0
  @total_bytes = 0
  @total_lines += @lines
  @total_words += @words
  @total_bytes += @bytes
end

# トータルを表示する処理
def display_total
    print @total_lines
  if @option["l"] == false
    print @total_words
    print @total_bytes
  end
end

if @files == []
  non_argument
else
  has_argument
  calc_total
  display_total
end
