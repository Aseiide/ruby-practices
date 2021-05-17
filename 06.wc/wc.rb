# frozen_string_literal: true

require 'optparse'
option = ARGV.getopts('l')
file = ARGV

# オプションなしを実装していく
text = $stdin.read

p text.count("\n")
p word = text.split(/\s+/).size
p text.bytesize

p file

# 引数ありのとき
# 引数に受けたファイルの改行数・単語数・バイト数とtotalをputsする


