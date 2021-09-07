# frozen_string_literal: true

class ShortOption
  PADDING = 24
  COLUMN_LENGTH = 3

  def initialize(file_details)
    @file_details = file_details
  end

  def print_result
    transposed_file_details = transpose_file_details(@file_details)
    transposed_file_details.each do |file_details|
      file_details.each do |file_detail|
        print file_detail.file_path.ljust(PADDING) if file_detail
      end
      puts
    end
  end

  private

  def transpose_file_details(paths)
    sliced_file_details = paths.each_slice(ShortOption::COLUMN_LENGTH).to_a
    flattened_file_details = sliced_file_details.flat_map { |file_details| file_details.values_at(0...ShortOption::COLUMN_LENGTH) }
    flattened_file_details.each_slice(flattened_file_details.size / ShortOption::COLUMN_LENGTH).to_a.transpose
  end
end
