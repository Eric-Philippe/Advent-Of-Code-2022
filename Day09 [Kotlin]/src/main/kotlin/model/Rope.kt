package model

import java.awt.Point

class Rope(head: Point = Point(0, 0), tail: Point = Point(0, 0)) {
    private var tailPosition: Point = tail
    private var headPosition: Point = head

    fun getTail(): Point {
        return tailPosition
    }

    fun getTailCoords(): String {
        return tailToString()
    }

    fun tailToString(): String {
        return tailPosition.x.toString() + "." + tailPosition.y.toString()
    }

    fun headToString(): String {
        return headPosition.x.toString() + "." + headPosition.y.toString()
    }

    fun updateTailsPosition(): String {
        var x = tailPosition.x
        var y = tailPosition.y
        var xh = headPosition.x
        var yh = headPosition.y

        // When direction is right
        if (xh == x && kotlin.math.abs(y - yh) > 1) {
            tailPosition = if (yh > y) Point(x, y + 1)
            else Point(x, y - 1)
        }

        if (yh == y && kotlin.math.abs(x - xh) > 1) {
            tailPosition = if (xh > x) Point(x + 1, y)
            else Point(x - 1, y)
        }

        if (xh != x && yh != y && !(kotlin.math.abs(x - xh) == 1 && kotlin.math.abs(y - yh) == 1)) {
            if (kotlin.math.abs(y - yh) == 1) {
                tailPosition = if (xh > x) Point(x + 1, yh)
                else Point(x - 1, yh)

            }

            if (kotlin.math.abs(x - xh) == 1) {
                tailPosition = if (yh > y) Point(xh, y + 1)
                else Point(xh, y - 1)
            }
        }
        return tailToString()
    }

    fun headUp() {
        headPosition = Point(headPosition.x, headPosition.y + 1)
    }

    fun headDown() {
        headPosition = Point(headPosition.x, headPosition.y - 1)
    }

    fun headLeft() {
        headPosition = Point(headPosition.x - 1, headPosition.y)
    }

    fun headRight() {
        headPosition = Point(headPosition.x + 1, headPosition.y)
    }

}