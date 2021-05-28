#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

@option = ARGV.getopts('l')

@files = ARGV

def main
  if @files.empty?
    @contents = $stdin.read
    non_argument
  else
    @total_lines = @total_words = @total_bytes = 0
    with_argument
  end
end

def non_argument
  lines, words, bytes = calc_lines_words_bytes
  show_result(lines, words, bytes)
  puts
end

def with_argument
  @files.each do |file|
    @contents = File.read(file)
    lines, words, bytes = calc_lines_words_bytes
    show_result(lines, words, bytes)
    puts " #{file}"
    calc_total(lines, words, bytes)
  end
  display_total if @files != []
end

# @option == true の形で書いてみる
def show_result(lines, words, bytes)

  print lines.to_s.rjust(8)
  return unless @option['l'] == false

  print words.to_s.rjust(8)
  print bytes.to_s.rjust(8)
end

def calc_lines_words_bytes
  lines = @contents.count("\n")
  words = @contents.split(/\s+/).size
  bytes = @contents.bytesize
  [lines, words, bytes]
end

def calc_total(lines, words, bytes)
  @total_lines += lines
  @total_words += words
  @total_bytes += bytes
end

def display_total
  print @total_lines.to_s.rjust(8)
  if @option['l'] == false
    print @total_words.to_s.rjust(8)
    print @total_bytes.to_s.rjust(8)
  end
  print ' total'
  puts
end

main
