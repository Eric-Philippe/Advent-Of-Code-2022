package answers

import model.Rope
import utils.*

class PartOne {
    fun visualizeVisitedMap(visitedMap: MutableSet<String>) {
        val minX = visitedMap.map { it.split(".").first().toInt() }.min()!!
        val maxX = visitedMap.map { it.split(".").first().toInt() }.max()!!
        val minY = visitedMap.map { it.split(".").last().toInt() }.min()!!
        val maxY = visitedMap.map { it.split(".").last().toInt() }.max()!!

        for (y in maxY downTo minY) {
            for (x in minX..maxX) {
                if (visitedMap.contains("$x.$y")) {
                    print("#")
                } else {
                    print(".")
                }
            }
            println()
        }
    }

    fun runPartOne(): Int {
        val instructions = readLinesAsListOfLists("put.txt")
        val visited: MutableSet<String> = mutableSetOf()
        val rope = Rope()
        var direction: String
        var distance: Int

        for (instruction in instructions) {
            direction = instruction.split(" ")[0]
            distance = instruction.split(" ")[1].toInt()

            for (i in 1..distance) {
                when (direction) {
                    "R" -> rope.headRight()
                    "L" -> rope.headLeft()
                    "U" -> rope.headUp()
                    "D" -> rope.headDown()
                }

                visited.add(rope.updateTailsPosition())
            }
        }
        return visited.size
    }
}

