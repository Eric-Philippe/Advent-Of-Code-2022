/**
 * @author EricP
 * @date 03/12/2022
 */
import java.util.ArrayList;

public class PartTwo {
    /**
     * Regroups every 3 lines of the given array into a new array
     * The data should looks like this [["", "", ""], ["", "", ""], ...]
     * @param array
     * @return
     */
    public static ArrayList<ArrayList<String>> regroupElementsByThree(ArrayList<String> array) {
        // Create a new ArrayList to store the regrouped data
        ArrayList<ArrayList<String>> regroupedData = new ArrayList<ArrayList<String>>();
        // Loop through the data and regroup every 3 lines
        for (int i = 0; i < array.size(); i += 3) {
            // Create a new ArrayList to store the regrouped data
            ArrayList<String> regroupedLine = new ArrayList<String>();
            // Loop through the data and regroup every 3 lines
            regroupedLine.add(array.get(i));
            regroupedLine.add(array.get(i + 1));
            regroupedLine.add(array.get(i + 2));
            // Add the regroupedLine ArrayList to the regroupedData ArrayList
            regroupedData.add(regroupedLine);
        }
        return regroupedData;
    }
    /**
     * Returns the first element that is presents in the three strings given in the parent array
     * @param array
     * @return String
     */
    public static String findCommonLetters(ArrayList<String> array) {
       // We return the first element that is presents in the three array given in the parent array
         // We loop through the first array
            for (int i = 0; i < array.get(0).length(); i++) {
                // We loop through the second array
                for (int j = 0; j < array.get(1).length(); j++) {
                    // We loop through the third array
                    for (int k = 0; k < array.get(2).length(); k++) {
                        // If the letter is the same in the three arrays
                        if (array.get(0).charAt(i) == array.get(1).charAt(j) && array.get(0).charAt(i) == array.get(2).charAt(k)) {
                            // We return the letter
                            return Character.toString(array.get(0).charAt(i));
                        }
                    }
                }
            }
        return "";
    }

    public static int run(Boolean debug) {
        int totalPriority = 0;
        // Read the data from the input file
        ArrayList<String> data = PartOne.readData();
        // Create groups of 3 lines
        ArrayList<ArrayList<String>> regroupedData = regroupElementsByThree(data);
        // Loop through the data and find the common letters
        for (int i = 0; i < regroupedData.size(); i++) {
            // Loop through the data and find the common letters
            // Find the common letter
            String commonLetter = findCommonLetters(regroupedData.get(i));
            System.out.println("Common letter: " + commonLetter);
            totalPriority += PartOne.triage(commonLetter);
        }
        if (debug) System.out.println("Total priority: " + totalPriority);
        return totalPriority;
    }
}
