import unittest

from File import File

class TestFileObject(unittest.TestCase):
    def test_init_file(self):
        file = File("267972 tbgcnf.pqz")
        self.assertEqual(file.getName(), "tbgcnf.pqz")
        self.assertEqual(file.getSize(), 267972)