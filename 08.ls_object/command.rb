class Command
  attr_reader :files, :option

  def initialize(option)
    @option = option
    @files = @option['a'] ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
    @files.reverse! if @option['r']
  end
end
