#include "PartOne.cpp"
#include "PartTwo.cpp"
#include <string>
#include <vector>
#include "CppUnitTest.h"
using namespace Microsoft::VisualStudio::CppUnitTestFramework;

namespace Day1Tests
{
    TEST_CLASS(Day1Tests)
    {
    public:
        
        TEST_METHOD(TestMethod1)
        {
            std::vector<std::string> data = getData();
            int result = getMaximumNumber(data);
            Assert::AreEqual(70764, result);
        }
        TEST_METHOD(TestMethod2)
        {
            std::vector<std::string> data = getData();
            int result = getMaximumNumber(data);
            Assert::AreEqual(203905, result);
        }
    };
}