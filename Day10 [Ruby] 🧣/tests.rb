require_relative 'utils'

module Tests
    def self.runTests()
        puts "Tests are running..."
    
        puts "Tests are done!"
    end

    def self.testFileRead()
        data = Utils.read_file
        if data[0] == "addx 2"
            puts "Test 1 passed!"
        else
            puts "Test 1 failed!"
        end
    end
end