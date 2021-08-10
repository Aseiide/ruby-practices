class ShortFormat
  attr_reader :files

  def initialize(files)
    @files = files
  end

  def display_arrange
    array = files.each_slice(4).map { |sub_files_names| Array.new(4) { sub_file_names.shift } }
    array.transpose.each do |record|
      record.each do |display|
        print display.to_s.ljust(20)
      end
      print "\n"
    end
  end
end
