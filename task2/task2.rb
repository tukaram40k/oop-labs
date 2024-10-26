class FileReader
    attr_accessor :name, :path, :content
    def initialize(name, path)
        @name = name
        @path = path
    end
    def read_file_into_string
        path = File.join(@path, @name)
        @content = File.read(path)
        puts(@content)
    end
end

class TextData
    attr_accessor :name, :text, :num_vowels, :num_consonants, :num_letters, :num_sentences, :longest_word
    def initialize(file)
        @name = file.name
        @text = file.content
    end
    def get_all_data
        
    end

    def get_vowels

    end
end

file_reader = FileReader.new(ARGV[0], ARGV[1])
file_reader.read_file_into_string

data = TextData.new(file_reader)