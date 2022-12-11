class Folder () :
    def __init__(self, name: str, parent = None):
        self.name = name
        self.parent = parent
        self.folders = []
        self.files = []
        self.isRoot = False if parent else True
        self.hasChildren = False
    """
    Add Folder to this folder
    """
    def addFolder(self, folder):
        self.folders.append(folder)
        self.hasChildren = True
    """
    Add File to this folder
    """
    def addFile(self, file):
        self.files.append(file)
        self.hasChildren = True
    """
    Get the size of the elements uniquely contained in this folder
    """
    def getSize(self) -> int:
        size = 0
        for file in self.files:
            size += file.getSize()
        return size
    """
    Get the size of the elements contained in this folder and all subfolders
    """
    def getTotalSize(self) -> int:
        size = self.getSize()
        for folder in self.folders:
            size += folder.getTotalSize()
        return size
    """
    Get the folder parent
    """
    def getParent(self):
        if self.isRoot : return None
        return self.parent
    """
    Get the folder name
    """
    def getName(self) -> str:
        return self.name
    """
    Get the folder children
    """
    def getChildren(self) -> list:
        return self.folders + self.files
    """
    Get the folder children folders
    """
    def getFolders(self) -> list:
        return self.folders
    """
    Returns a list of all the folders contained in this folder and all subfolders
    """
    def getAllFolders(self) -> list:
        allFolders = []
        if self.hasChildren:
            for folder in self.folders:
                allFolders.append(folder)
                if folder.hasChildren:
                    # Concatenate the list of all subfolders
                    allFolders = allFolders + folder.getAllFolders()
        return allFolders  
    """
    print 
    Display like this:
    root - 3000 bytes
    |__ folder1 - 2000 bytes
    |   |__ file1.txt
    |   |__ file2.exe
    |   |__ folder2 - 1000 bytes
    |       |__ file3.truc
    """
    def toString(self, depth = 0) -> str:
        # Build recursively the string to display the folder tree   
        string = ""
        # Add the name of the folder
        string += "    " * depth + "|__ " + self.name + "\n"
        # If the folder has children we display the files then the folders
        if self.hasChildren:
            for file in self.files:
                string += "    " * (depth + 1) + "|__ " + file.getName()
            
            for folder in self.folders:
                string += " " + folder.toString(depth + 1) + str(folder.getTotalSize()) + " bytes"
        return string
    """
    Surcharge of the str function
    """
    def __str__(self):
        return self.name + " " + str(self.getTotalSize()) + " bytes"

