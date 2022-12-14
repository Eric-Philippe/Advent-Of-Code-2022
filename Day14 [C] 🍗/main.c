#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "partOne.h"
#include "partTwo.h"

int main () {
    int argc = 1;
    char *argv[] = {"main"};
    int result = 0;
    result = runPartOne(argc, argv);
    result = runPartTwo(argc, argv);
    return result;
}