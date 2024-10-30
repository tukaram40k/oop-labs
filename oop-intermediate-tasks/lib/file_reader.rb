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