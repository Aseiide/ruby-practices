class Option
  def initialize(option = ARGV.getopts('alr'))
    @option = option
  end

  def a_option
    @option['a']
  end

  def r_option
    @option['r']
  end

  def l_option
    @option['l']
  end
end
