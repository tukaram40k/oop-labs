require_relative 'lib/file_reader'
require_relative 'lib/text_data'

if ARGV.length < 2 || ARGV.length % 2 != 0
    puts "Missing command line argument"
else
    (0...ARGV.length).step(2) do |i|
        file_reader = FileReader.new(ARGV[i], ARGV[i + 1])
        file_reader.read_file_into_string
        data = TextData.new(file_reader)
        data.do_all
        puts " "
    end
end

# ruby task4.rb input1.txt input input2.txt input input3.txt input