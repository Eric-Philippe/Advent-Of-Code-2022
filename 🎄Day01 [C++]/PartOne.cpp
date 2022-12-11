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
/** Convert what we read from the file into a list of numbers and returns the maximum number */
int getMaximumNumber() {
    // Get the data from the input file
    std::vector<std::string> data = getData();
    // Initiate the maximum number
    int max = 0;
    // Loop through the data
    for (int i = 0; i < data.size(); i++) {
        // Get the current line
        std::string line = data[i];
        // Convert the line into a number
        int number = std::stoi(line);
        // If the number is bigger than the maximum number we set it as the maximum number
        if (number > max) {
            max = number;
        }
    }
    return max;
}
/** Main Runner */
void runPOne(bool debug = true) {
    // read the data from the input file
    std::vector<std::string> data = getData();
    int result = getMaximumNumber();
    if (debug) std::cout << result << std::endl;
}

