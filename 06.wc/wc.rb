# frozen_string_literal: true

require 'optparse'

@option = ARGV.getopts('l')
@files = ARGV
if @files == []
  @contents = $stdin.read
else
  @files.each do |file|
    @contents = File.read(file)
    @lines = @contents.count("\n")
    @words = @contents.split(/\s+/).size
    @bytes = @contents.bytesize
  end
end

# 引数がなしの時
# 標準入力の改行数、バイト数、単語数を表示
# lオプションのときだけ改行数を表示する
if @files == [] && @option['l'] == false
  @lines = @contents.count("\n")
  @words = @contents.split(/\s+/).size
  @bytes = @contents.bytesize
  puts "#{@lines} #{@words} #{@bytes}"
elsif @files == [] && @option['l'] == true
  @lines = @contents.count("\n")
  printf "%7d\n", @lines
end


# def calc_lines_words_bytes
#   @lines = @contents.count("\n")
#   @words = @contents.split(/\s+/).size
#   @bytes = @contents.bytesize
# end

# def result
#   if @option['l'] == true
#     puts @lines
#   else
#     print @lines
#     print @words
#     print @bytes
#   end
# end
# # 引数がなかった時
# # 標準入力して改行数、単語数、バイト数、ファイル名を出力
# def non_argument

#   puts "#{lines} #{words} #{bytes}"
# end

# # 引数ありの処理
# def has_argument
#   @files.each do |file|
#     @contents = File.read(file)
#     puts "#{@lines} #{@words} #{@bytes} #{@file}"
#   end
#   display_total
# end

# # トータルを計算する処理を切り出す
# def calc_total
#   @total_lines = @total_words = @total_bytes = 0
#   @total_lines += @lines
#   @total_words += @words
#   @total_bytes += @bytes
# end

# # トータルを表示する処理
# def display_total
#   print @total_lines
#   print @total_words
#   print @total_bytes
# end
