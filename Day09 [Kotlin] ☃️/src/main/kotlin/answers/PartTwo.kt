package answers

import model.RopeExtended
import utils.readLinesAsListOfLists

class PartTwo {
    fun runPartTwo(): Int {
        val instructions = readLinesAsListOfLists("put.txt")
        val visitedOne: MutableSet<String> = mutableSetOf()
        val visitedTwo: MutableSet<String> = mutableSetOf()
        val ropeObj = RopeExtended()
        var direction: String
        var distance: Int

        for (instruction in instructions) {
            direction = instruction.split(" ")[0]
            distance = instruction.split(" ")[1].toInt()

            for (c in 1 .. distance) {
                when (direction) {
                    "R" -> ropeObj.turnRight()
                    "L" -> ropeObj.turnLeft()
                    "U" -> ropeObj.turnUp()
                    "D" -> ropeObj.turnDown()
                }

                // loop through the rope array length - 1
                for (i in 0 until ropeObj.rope.size - 1) {
                    ropeObj.updateTailPosition(ropeObj.rope[i + 1], ropeObj.rope[i], i + 1)
                    visitedOne.add(ropeObj.rope[9].x.toString() + "," + ropeObj.rope[9].y.toString())
                    visitedTwo.add(ropeObj.rope[1].x.toString() + "," + ropeObj.rope[1].y.toString())
                }
                ropeObj.printRope()
            }
        }
        println("visitedOne: ${visitedOne.size}")
        println("visitedTwo: ${visitedTwo.size}")
        return visitedTwo.size
    }
}