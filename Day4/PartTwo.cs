// Export PartOne class

using System;

public class PartTwo
{
    public static string readFile() {
       // Get the path of the current directory
         string path = System.IO.Directory.GetCurrentDirectory();
            // Get the path of the file
            string filePath = System.IO.Path.Combine(path, "input.txt");
        // Read the file and return the content
        return System.IO.File.ReadAllText(path + "/input.txt");
    }

    public static string[] splitInput(string input) {
        // Split the input by new line
        return input.Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
    }

    public static bool isOverlapped(string str1, string str2) {
        // the two str look like this "1-2"
        // Split the two str by "-"
        string[] str1Split = str1.Split('-');
        string[] str2Split = str2.Split('-');
        // Convert the two str to int
        int str1Min = Int32.Parse(str1Split[0]);
        int str1Max = Int32.Parse(str1Split[1]);
        int str2Min = Int32.Parse(str2Split[0]);
        int str2Max = Int32.Parse(str2Split[1]);
        // Check if the two str are overlapped each other
        if (str1Min <= str2Min && str1Max >= str2Min) {
            return true;
        }
        return false;
    }
    /**
    * Check if a line contains a range inside the other
    * @param {string[]} input
    * @example 2-8 fully contains 3-6
    * @eample 6-6 is fully contained in 4-6
    * Each lines looks like this : 1-1,2-4 
    * @return The total of occurrences
    */
    public static int processSameRange(string[] input) {
        int total = 0;
        // Loop through the input
        for (int i = 0; i < input.Length; i++) {
            // Split the current line by comma
            string[] ranges = input[i].Split(',');
            // Check if the first range is overlapped in the second range
            if (isOverlapped(ranges[0], ranges[1])) {
                // If it is, increment the total
                total++;
            } else if (isOverlapped(ranges[1], ranges[0])) {
                // If the second range is overlapped in the first range, increment the total
                total++;
            }
        }

        // Return the total
        return total;
    }

    public static void run(bool debug = true)
    {
        // Read the file
        string input = readFile();
        // Split the input
        string[] inputSplit = splitInput(input);
        // Process the input
        int total = processSameRange(inputSplit);
        // Print the total
        if (debug) Console.WriteLine(total);
    }
}