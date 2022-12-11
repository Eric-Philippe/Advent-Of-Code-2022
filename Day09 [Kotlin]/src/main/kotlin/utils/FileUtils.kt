package utils;

import java.io.File
    // Return a list like this for each line ["A 1"]
    fun readLinesAsListOfLists(fileName: String): List<String> {
        val file = File(fileName)
        return file.readLines()
    }
