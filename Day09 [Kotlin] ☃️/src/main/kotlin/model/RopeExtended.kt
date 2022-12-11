package model

import java.awt.Point
import kotlin.math.abs

class RopeExtended (len: Int = 10) {
    private var length: Int = len
    // Create an array of rope with the length of the rope, containing points
    var rope = Array(length) { Point(0, 0) }

    fun updateTailPosition(oldTailingBlock: Point, headingBlock: Point, index: Int) {
        val x = oldTailingBlock.x
        val y = oldTailingBlock.y
        val xh = headingBlock.x
        val yh = headingBlock.y
        var tailingBlock = Point(x, y)

        if (xh == x && Math.abs(y - yh) > 1) {
            tailingBlock = if (yh > y) Point(x, y + 1)
            else Point(x, y - 1)
        }

        if (yh == y && Math.abs(x - xh) > 1) {
            tailingBlock = if (xh > x) Point(x + 1, y)
            else Point(x - 1, y)
        }

        if (xh != x && yh != y && !(abs(x - xh) == 1 && abs(y - yh) == 1)) {
            if (abs(y - yh) == 1) {
                tailingBlock = if (xh > x) Point(x + 1, yh)
                else Point(x - 1, yh);
            }

            if (abs(x - xh) == 1) {
                tailingBlock = if (yh > y) Point(xh, y + 1)
                else Point(xh, y - 1)
            }
        }

        if (abs(xh - x) == 2 && abs(yh - y) == 2) {
            if (xh > x) tailingBlock = Point(x + 1, y)
            else tailingBlock = Point(x - 1, y)
            if (yh > y) tailingBlock = Point(tailingBlock.x, y + 1)
            else tailingBlock = Point(tailingBlock.x, y - 1)
        }
        rope[index] = tailingBlock
    }

    fun turnRight() {
        rope[0] = Point(rope[0].x + 1, rope[0].y)
    }

    fun turnLeft() {
        rope[0] = Point(rope[0].x - 1, rope[0].y)
    }

    fun turnUp() {
        rope[0] = Point(rope[0].x, rope[0].y + 1)
    }

    fun turnDown() {
        rope[0] = Point(rope[0].x, rope[0].y - 1)
    }

    fun printRope() {
        println("Rope: ")
        for (i in 0 until length) {
            println(rope[i])
        }
        println("=====================================")
    }
}