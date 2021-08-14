# frozen_string_literal: true

require_relative './command'
require_relative './file_data'
require_relative './long_option'
require_relative './short_option'

def main
  options = ARGV.getopts('a', 'l', 'r')
  command = Command.new(a_option: options['a'], l_option: options['l'], r_option: options['r'])
  command.output
end

main
