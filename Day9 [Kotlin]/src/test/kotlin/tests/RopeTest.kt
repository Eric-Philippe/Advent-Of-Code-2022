package tests

import model.Rope
import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*
import java.awt.Point

internal class RopeTest {

    @Test
    fun getTail() {
        val rope = Rope()
        assertEquals(Point(0, 0), rope.getTail())
    }

    @Test
    fun getTailCoords() {
        val rope = Rope()
        assertEquals("O.O", rope.getTailCoords())
    }

    @Test
    fun tailToString() {
        val rope = Rope()
        assertEquals("O.O", rope.tailToString())
    }

    @Test
    fun headToString() {
        val rope = Rope()
        assertEquals("O.O", rope.headToString())
    }

    @Test
    fun headUp() {
        val rope = Rope()
        rope.headUp()
        assertEquals("O.1", rope.headToString())
    }

    @Test
    fun headDown() {
        val rope = Rope()
        rope.headDown()
        assertEquals("O.-1", rope.headToString())
    }

    @Test
    fun headLeft() {
        val rope = Rope()
        rope.headLeft()
        assertEquals("-1.0", rope.headToString())
    }

    @Test
    fun headRight() {
        val rope = Rope()
        rope.headRight()
        assertEquals("1.0", rope.headToString())
    }
}