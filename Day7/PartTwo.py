from math import inf
from Folder import Folder
from File import File

FREE_SPACE_AVAILABLE = 70_000_000
SPACE_NEED_TO_FREE = 30_000_000

from Folder import Folder
"""
Find the folder that if deleted will free the less space possible
"""
def getSmallerFolderToDelete(root: Folder) -> Folder:
    # Get the folders that have children
    folders = root.getAllFolders()
    # find the total size of the folders
    totalSize = 0
    for folder in folders:
        totalSize += folder.getSize()

    freeSpace = FREE_SPACE_AVAILABLE - totalSize
    spaceRequiredForUpdate = SPACE_NEED_TO_FREE - freeSpace
    print("Space required for update: " + str(spaceRequiredForUpdate))
    
    currentSmallestFolder = root

    for folder in folders:
        if folder.getTotalSize() > spaceRequiredForUpdate:
            if folder.getTotalSize() < currentSmallestFolder.getTotalSize():
                currentSmallestFolder = folder

    return currentSmallestFolder
  
__all__ = ["getSmallerFolderToDelete"]