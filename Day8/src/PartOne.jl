module PartOne
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

    function count_visible(map)
        visibleTrees = Set()
        for y in 1:length(map)
            row = map[y]
            max = -1
            for x in 1:length(row)
                if row[x] > max
                    max = row[x]
                    push!(visibleTrees, ("$x,$y"))
                end # if   
            end # for

            max = -1
            for x in length(row):-1:1
                if row[x] > max
                    max = row[x]
                    push!(visibleTrees, ("$x,$y"))
                end # if   
            end # for
        end
        
        for x in 1:length(map[1])
            max = -1
            for y in 1:length(map)
                if map[y][x] > max
                    max = map[y][x]
                    push!(visibleTrees, ("$x,$y"))
                end # if   
            end # for

            max = -1
            for y in length(map):-1:1
                if map[y][x] > max
                    max = map[y][x]
                    push!(visibleTrees, ("$x,$y"))
                end # if   
            end # for
        end
        return length(visibleTrees)
    end
    data = read_data()
    println(count_visible(data))
end