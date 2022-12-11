import unittest

from Folder import Folder
from File import File

class TestFileObject(unittest.TestCase):
    def test_init_file(self):
        folder = Folder("root")
        self.assertEqual(folder.getName(), "root")
    
    def test_add_folder(self):
        folder = Folder("root")
        folder.addFolder(Folder("folder"))
        self.assertEqual(len(folder.getFolders()), 1)

    def test_add_file(self):
        folder = Folder("root")
        folder.addFile(File("267972 tbgcnf.pqz"))
        self.assertEqual(len(folder.getFiles()), 1)

    def test_get_size(self):
        folder = Folder("root")
        folder.addFile(File("267972 tbgcnf.pqz"))
        self.assertEqual(folder.getSize(), 267972)

    def test_get_total_size(self):
        folder = Folder("root")
        folder.addFile(File("267972 tbgcnf.pqz"))
        folder.addFolder(Folder("folder"))
        folder.getFolders()[0].addFile(File("267972 tbgcnf.pqz"))
        self.assertEqual(folder.getTotalSize(), 535944)

    def test_get_parent(self):
        folder = Folder("root")
        folder.addFolder(Folder("folder"))
        self.assertEqual(folder.getFolders()[0].getParent(), folder)