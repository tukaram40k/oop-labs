require_relative 'lib/file_reader'
require_relative 'lib/text_data'

file_reader = FileReader.new(ARGV[0], ARGV[1])
file_reader.read_file_into_string

data = TextData.new(file_reader)
data.do_all