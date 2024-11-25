require 'fileutils'

class FileScanner
    attr_accessor :scan_dir, :logs_dir, :log_name
    def initialize(scan_dir, logs_dir, log_name)
        @scan_dir = scan_dir
        @logs_dir = logs_dir
        @log_name = log_name
    end

    def log_files
        FileUtils.mkdir_p(@logs_dir)

        log_file_path = File.join(@logs_dir, "#{@log_name}.txt")
        json_files = Dir["#{@scan_dir}/*.json"]

        File.open(log_file_path, 'a') do |log_file|
            json_files.each do |json_file|
                content = File.read(json_file)

                timestamp = Time.now.strftime("[%Y-%m-%d %H:%M:%S]")
                log_file.puts "#{timestamp} #{content}"
            end
        end
    end

    def clear
        File.open("#{@logs_dir}/#{@log_name}.txt", 'w') {|file| file.truncate(0) }
    end
end