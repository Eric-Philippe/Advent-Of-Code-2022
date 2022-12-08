from Folder import Folder

class File:
    def __init__(self, rawName: str, parent: Folder = None):
        self.name, self.size = self.rawNameToParts(rawName)
        self.parent = parent
    """
    With a raw name like "267972 tbgcnf.pqz" return a File object with name "tbgcnf.pqz" and size 267972
    """
    def rawNameToParts(self, rawName) -> tuple[str, int]:
        name = rawName.split(" ")[1]
        size = rawName.split(" ")[0]
        return name, int(size)
    """
    Return the name of the file
    """
    def getName(self) -> str:
        return self.name
    """
    Return the size of the file
    """
    def getSize(self) -> int:
        return self.size
    """
    Return the parent folder of the file
    """
    def getParent(self) -> Folder:
        return self.parent
    """
    To String
    """
    def __str__(self):
        return self.name + " " + self.size + " bytes"
        