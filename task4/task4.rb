class FileReader
    attr_accessor :name, :path, :content
    def initialize(name, path)
        raise "Missing command line argument" if name.nil? or path.nil?
        @name = name
        @path = path
    end
    def read_file_into_string
        path = File.join(@path, @name)
        @content = File.read(path)
    end
end

class TextData
    attr_accessor :name, :text, :num_vowels, :num_consonants, :num_letters, :num_sentences, :longest_word
    def initialize(file)
        @name = file.name
        @text = file.content
    end

    def get_letters
        vows = 0
        cons = 0
        @text.each_char do |letter|
            if %w[a e i o u A E I O U].include?(letter)
                vows += 1
            elsif %w[b c d f g h j k l m n p q r s t v w x y z B C D F G H J K L M N P Q R S T V W X Y Z].include?(letter)
                cons += 1
            end
        end
        @num_vowels = vows
        @num_consonants = cons
        @num_letters = vows + cons
    end

    def get_num_sentences
        num = 0
        @text.each_char do |letter|
            num += 1 if %w[. ! ?].include?(letter)
        end
        @num_sentences = num
    end

    def get_longest_word
        current_word = ""
        longest_word = ""
        specials = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '+', '=', '_', ',', '.', '?', '/', '\n', '\t', ' ']
        @text.each_char do |letter|
            if specials.include?(letter)
                if current_word.length > longest_word.length
                    longest_word = current_word
                end
                current_word = ""
            else
                current_word << letter
            end
        end
        longest_word = current_word if current_word.length > longest_word.length
        @longest_word = longest_word
    end

    def print_data
        puts("file name: #{@name}")
        puts("file content: #{@text}")
        puts("number of vowels: #{@num_vowels}")
        puts("number of consonants: #{@num_consonants}")
        puts("number of letters: #{@num_letters}")
        puts("longest word: #{@longest_word}")
        puts("num sentences: #{@num_sentences}")
    end

    def do_all
        get_letters
        get_num_sentences
        get_longest_word
        print_data
    end
end

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