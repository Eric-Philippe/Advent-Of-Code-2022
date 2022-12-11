package tests

import model.RopeExtended
import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*
import java.awt.Point

internal class RopeExtendedTest {
    @Test
    fun turnRight() {
        val rope = RopeExtended()
        rope.turnRight()
        assertEquals(Point(1,0), rope.rope[0].toString())
    }

    @Test
    fun turnLeft() {
        val rope = RopeExtended()
        rope.turnLeft()
        assertEquals(Point(-1,0), rope.rope[0].toString())
    }

    @Test
    fun turnUp() {
        val rope = RopeExtended()
        rope.turnUp()
        assertEquals(Point(0,1), rope.rope[0].toString())
    }

    @Test
    fun turnDown() {
        val rope = RopeExtended()
        rope.turnDown()
        assertEquals(Point(0,-1), rope.rope[0].toString())
    }
}