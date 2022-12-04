using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using NUnit.Framework;

namespace Day4
{
    public class Day4NUnit
    {
        [SetUp]
        public void Setup()
        {
        }

       [Test]
        public void TestPartOneReadFile() {
            // Test the readFile method
            string expected = "1-1,2-4";
            string actual = PartOne.readFile();
            Assert.That(actual, Is.EqualTo(expected));
        }
        [Test]
        public void TestPartOneIsFullyContained() {
            // Test the isFullyContained method
            Assert.That(PartOne.isFullyContained("14-38", "14-14"), Is.EqualTo(true));
        }
        [Test]
        public void TestPartTwoReadFile() {
            // Test the readFile method
            string expected = "14-38,14-14";
            string actual = PartTwo.readFile();
            Assert.That(actual, Is.EqualTo(expected));
        }
        [Test]
        public void TestPartTwoIsisOverlapped() {
            // Test the isOverlapped method
            Assert.That(PartTwo.isOverlapped("14-38", "14-14"), Is.EqualTo(true));
        }
    }
}