#include <iostream>
#include <fstream>
#include <string>
#include <vector>
/** Read the data from the input file */
std::vector<std::string> getData() {
    std::vector<std::string> data;
    std::ifstream file("input.txt");
    std::string line;
    while (std::getline(file, line)) {
        data.push_back(line);
    }
    return data;
}
/** Sort a int vector by desc order */
void sortVector(std::vector<int> &vector) {
    for (int i = 0; i < vector.size(); i++) {
        for (int j = i + 1; j < vector.size(); j++) {
            if (vector[i] < vector[j]) {
                int temp = vector[i];
                vector[i] = vector[j];
                vector[j] = temp;
            }
        }
    }
}
/** Convert the data read to a list of sum separated by blank lines and returns the three largest numbers */
int getThreeLargestNumbers() {
    // Get the data from the input file
    std::vector<std::string> data = getData();
    // Initiate the vector of numbers
    std::vector<int> numbers;
    // Initiate the vector of sums
    std::vector<int> sums;
    for (int i = 0; i < data.size(); i++) {
        // Get the current line
        std::string line = data[i];
        // If the line is blank we add the sum to the sums vector
        if (line == "") {
            int sum = 0;
            for (int j = 0; j < numbers.size(); j++) {
                sum += numbers[j];
            }
            sums.push_back(sum);
            numbers.clear();
        } else {
            // If the line is not blank we add the number to the numbers vector
            int number = std::stoi(line);
            numbers.push_back(number);
        }
    }
    // Sort the sums vector
    sortVector(sums);
    // Initiate the vector of the three largest numbers
    std::vector<int> threeLargestNumbers;
    // Add the three largest numbers
    return sums[0] + sums[1] + sums[2];
}
/** Main Runner */
void runPTwo(bool debug = true) {
    // read the data from the input file
    std::vector<std::string> data = getData();
    int result = getThreeLargestNumbers();
    if (debug) std::cout << result << std::endl;
}

