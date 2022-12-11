module PartTwo
    # Read the data from the input.txt file and make an array of array of int with each number as an element
    function read_data()
        data = []
        open("input.txt") do file
            for line in eachline(file)
                push!(data, [parse(Int, char) for char in line])
            end
        end
        return data
    end

    function getTreeViewScore(map, x, y)
        treeValue = map[y][x]

        scoreTop = 0
        for i in y-1:-1:1
            if treeValue > map[i][x] 
                scoreTop += 1
            else
                scoreTop += 1
                break
            end # if
        end # for

        scoreBottom = 0
        for i in y+1:length(map)
            if treeValue > map[i][x] 
                scoreBottom += 1
            else
                scoreBottom += 1
                break
            end # if
        end # for

        scoreLeft = 0
        for i in x-1:-1:1
            if treeValue > map[y][i] 
                scoreLeft += 1
            else
                scoreLeft += 1
                break
            end # if
        end # for

        scoreRight = 0
        for i in x+1:length(map[y])
            if treeValue > map[y][i] 
                scoreRight += 1
            else
                scoreRight += 1
                break
            end # if
        end # for

        return scoreTop * scoreBottom * scoreLeft * scoreRight
    end # function

    function getMax(map)
        max = 0
        for y in 1:length(map)
            for x in 1:length(map[y])
                score = getTreeViewScore(map, x, y)
                if score > max
                    max = score
                end # if
            end # for
        end # for
        return max
    end # function
    
    println(getMax(read_data()))
end