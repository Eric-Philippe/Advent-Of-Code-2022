# Create a method to read the content of input.txt and store each line in an array
def read_file
    file = File.open("input", "r")
    file.readlines.map(&:chomp)
    end

module Utils
    module_function :read_file
end