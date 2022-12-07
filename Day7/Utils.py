from Folder import Folder
from File import File

"""
GetData from input.txt
"""
def getData() -> list:
    with open("input.txt", "r") as file:
        return file.readlines()
"""
Get Repository tree from data
"""
def buildRepositoryTree(data: list) -> Folder:
    # Initialize root folder
    root = Folder("root")
    # Initialize current folder
    currentFolder = root
    # Loop through data, we skip the first line
    for line in data[1:]:
        # If the line starts with a $ the line represents a command
        if line.startswith("$"):
            # If the command is cd
            if line.startswith("$ cd"):
                # If the command is cd .. we go back to the parent folder
                if line.startswith("$ cd .."):
                    currentFolder = currentFolder.getParent()
                else :
                    # If the command is cd folder we go to the folder
                    folderName = line.split(" ")[2].replace("\n", "")
                    for folder in currentFolder.getFolders():
                        if folder.getName() == folderName:
                            currentFolder = folder
                            break
        else:
            if line.startswith("dir"):
                # If the line starts with d it's a folder
                folderName = line.split(" ")[1].replace("\n", "")
                folder = Folder(folderName, currentFolder)
                currentFolder.addFolder(folder)
            else:
                # If the line starts with a number it's a file
                file = File(line, currentFolder)
                currentFolder.addFile(file)

    return root

__all__ = ["getData", "buildRepositoryTree"]