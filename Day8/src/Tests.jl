# Tests the functions of the Day8 module
function test_Day8()
    # Test the read_data function
    @testset "read_data" begin
        @test Day8.read_data() == [[3, 4, 1, 5], [5, 5, 5, 1], [5, 1, 5, 5], [1, 2, 3, 4], [4, 3, 2, 1]]
    end

    # Test the count_visible function
    @testset "count_visible" begin
        @test Day8.count_visible(Day8.read_data()) == 9
    end

    # Test the getTreeViewScore function
    @testset "getTreeViewScore" begin
        @test Day8.getTreeViewScore(Day8.read_data(), 1, 1) == 1
        @test Day8.getTreeViewScore(Day8.read_data(), 2, 1) == 1
        @test Day8.getTreeViewScore(Day8.read_data(), 3, 1) == 1
        @test Day8.getTreeViewScore(Day8.read_data(), 4, 1) == 1
        @test Day8.getTreeViewScore(Day8.read_data(), 1, 2) == 1
        @test Day8.getTreeViewScore(Day8.read_data(), 2, 2) == 1
    end # testset

