import unittest
from PartOne import *
from PartTwo import *

class UneClasseDeTest(unittest.TestCase):

    def test_read_data_p1(self):
        data = read_data()
        self.assertIsInstance(data, str)
    
    def test_convert_data_p1(self):
        data = read_data()
        result = convert_data(data)
        self.assertIsInstance(result, int)

    def test_convert_data_max_p1(self):
        data = read_data()
        result = convert_data(data)
        self.assertEqual(result, 203905)

        
print(__name__)

if __name__ == '__main__':
    unittest.main()