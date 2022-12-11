/**
 * @author EricP
 * @date 03/12/2022
 */
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

public class PartOne {
    public static ArrayList<String> readData () {
        String data = "";
        try {
            data = new String(Files.readAllBytes(Paths.get("input")));
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }
        // Split the data into an array of strings by newlines
        ArrayList<String> dataLines = new ArrayList<String>();
        for (String line : data.split("\\r?\\n")) {
            dataLines.add(line);
        }
        return dataLines;
    }

    /**
     * Returns the same given ArrayList but every element is halved in another ArrayList
     * @param data
     * @return
     */
    public static ArrayList<ArrayList<String>> halving (ArrayList<String> data) {
       // Create a new ArrayList to store the halved data
         ArrayList<ArrayList<String>> halvedData = new ArrayList<ArrayList<String>>();
            // Loop through the data and halve each element
            for (String line : data) {
                // Create a new ArrayList to store the halved data
                ArrayList<String> halvedLine = new ArrayList<String>();
                // Loop through the data and halve each element
                // Split the line into an array of two strings having the same length
                String[] splitLine = line.split("(?<=\\G.{" + line.length()/2 + "})");
                // Add the two halves to the halvedLine ArrayList
                halvedLine.add(splitLine[0]);
                halvedLine.add(splitLine[1]);
                // Add the halvedLine ArrayList to the halvedData ArrayList
                halvedData.add(halvedLine);
            }
        return halvedData;
    }

    /**
     * Returns the number of priority for each letter
     * From lowercase a to z => 1 to 26
     * From uppercase A to Z => 27 to 52
     * @param letter
     * @return int
     */
    public static int triage(String letter) {
        // Get the ASCII code of the letter
        int ascii = (int) letter.charAt(0);
        // If the letter is lowercase
        if (ascii >= 97 && ascii <= 122) {
            return ascii - 96;
        }
        // If the letter is uppercase
        if (ascii >= 65 && ascii <= 90) {
            return ascii - 38;
        }
        // If the letter is not a letter
        return 0;
    }

    /**
     * Returns the char that appears in the two given strings
     * @param str1
     * @param str2
     * @return Char
     */
    public static Character occurrenceDetector(String str1, String str2) {
        // Loop through the first string
        for (int i = 0; i < str1.length(); i++) {
            // If the char is in the second string
            if (str2.indexOf(str1.charAt(i)) != -1) {
                // Return the char
                return str1.charAt(i);
            }
        }
        // If no char is found
        return null;
    }

    public static int run(Boolean debug) {
        int totalPriority = 0;
        // Read the data
        ArrayList<String> data = readData();
        // Halve the data
        ArrayList<ArrayList<String>> halvedData = halving(data);
        // Loop through the halved data
        for (ArrayList<String> line : halvedData) {
            // Get the char that appears in the two strings
            Character charFound = occurrenceDetector(line.get(0), line.get(1));
            // If a char is found
            if (charFound != null) {
                // Get the priority of the char
                int priority = triage(charFound.toString());
                // Add the priority to the total priority
                totalPriority += priority;
            }
        }
        if (debug) System.out.println("Total priority: " + totalPriority);
        return totalPriority;
    }
}
