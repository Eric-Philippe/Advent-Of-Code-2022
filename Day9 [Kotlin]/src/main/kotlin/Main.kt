// Import the PartOne class from the PartOne.tk file
import utils.*
import answers.PartOne
import answers.PartTwo


fun main(args: Array<String>) {
    // Create a new instance of the PartOne class
    val partOne = PartOne()

    // Call the function from the PartOne class
    println(partOne.runPartOne())

    val partTwo = PartTwo()
    println(partTwo.runPartTwo())
}