# frozen_string_literal: true

require 'optparse'

@option = ARGV.getopts('l')
@files = ARGV
if @files == []
  @contents = $stdin.read
else
  @files.each do |file|
    @contents = File.read(file)
    calc_lines_words_bytes
  end
end

def calc_lines_words_bytes
  @lines = @contents.count("\n")
  @words = @contents.split(/\s+/).size
  @bytes = @contents.bytesize
end

# 引数がなしの時
if @files == [] && @option['l'] == false
  calc_lines_words_bytes
  puts "#{@lines} #{@words} #{@bytes}"
elsif @files == [] && @option['l'] == true
  @lines = @contents.count("\n")
  printf "%7d\n", @lines
end

# 引数ありの時
# 引数あり && オプションなし, 引数あり && オプションあり
if @files != [] && @option["l"] == false
  @files.each do |file|
    @contents = File.read(file)
    calc_lines_words_bytes
    puts "#{@lines} #{@words} #{@bytes} #{file}"
  end
  total_lines = total_words = total_bytes = 0
  total_lines += @lines
  total_words += @words
  total_bytes += @bytes
  puts "#{total_lines} #{total_words} #{total_bytes} total"
end
