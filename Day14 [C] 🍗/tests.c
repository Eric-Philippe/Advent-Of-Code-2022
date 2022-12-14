// Generate test cases for the program

#include "tests.h"
#include "partOne.h"
#include "partTwo.h"

int test () {
    int argc = 1;
    char *argv[] = {"main"};
    int result = 0;
    result = runPartOne(argc, argv);
    result = runPartTwo(argc, argv);
    return result;
}

// Path: tests.c