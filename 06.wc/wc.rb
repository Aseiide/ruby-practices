# frozen_string_literal: true

require 'optparse'
options = ARGV.getopts('l')

# オプションなしを実装していく
text = $stdin.read

p text.count("\n")
p word = text.split(/\s+/).size
p text.bytesize
