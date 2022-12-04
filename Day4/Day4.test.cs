using UnitTesting;
using System;

namespace Day4UnitTest
{
    [TestClass]
    public class Day4UnitTest {
        [TestMethod]
        public void TestPartOneReadFile() {
            // Test the readFile method
            Assert.AreEqual("14-38,14-14", AdventOfCodeDay4.PartOne.readFile()[0]);
        }
        [TestMethod]
        public void TestPartOneIsFullyContained() {
            // Test the isFullyContained method
            Assert.AreEqual(true, AdventOfCodeDay4.PartOne.isFullyContained("14-38", "14-14"));
        }
        [TestMethod]
        public void TestPartOneProcessSameRange() {
            // Test the processSameRange method
            Assert.AreEqual(1, AdventOfCodeDay4.PartOne.processSameRange(AdventOfCodeDay4.PartOne.readFile()));
        }
        [TestMethod]
        public void TestPartTwoReadFile() {
            // Test the readFile method
            Assert.AreEqual("14-38,14-14", AdventOfCodeDay4.PartTwo.readFile()[0]);
        }
        [TestMethod]
        public void TestPartTwoIsisOverlapped() {
            // Test the isOverlapped method
            Assert.AreEqual(true, AdventOfCodeDay4.PartTwo.isOverlapped("14-38", "14-14"));
        }
        [TestMethod]
        public void TestPartTwoProcessSameRange() {
            // Test the processSameRange method
            Assert.AreEqual(1, AdventOfCodeDay4.PartTwo.processSameRange(AdventOfCodeDay4.PartTwo.readFile()));
        }
    }
}