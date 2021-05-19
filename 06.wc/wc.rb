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

def result
  print @lines
  unless @option['l']
    print @lines
    print @words
    print @bytes
  end
end

def calc_lines_words_bytes
  @lines = calc_lines(str)
  @words = calc_words(str)
  @bytes = calc_bytes(str)
end

def calc_lines(str)
  str.count("\n")
end

def calc_words(str)
  str.split(/\s+/).size
end

def calc_bytes(str)
  str.bytesize
end

def calc_total
  @total_lines += @contents.count("\n")
  @total_words += @contents.split(/\s+/).size
  @total_bytes += @contents.bytesize
end

def display_total
  print @total_lines
  if @option['l'] == false
    print @total_words
    print @total_bytes
  end
end
