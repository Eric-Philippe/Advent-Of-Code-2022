from Folder import Folder
"""
Get the sum of all folders sizes that are under 100000
"""
def getSumOfSmallFolders(root: Folder) -> int:
    sum = 0
    # Go recursively through all folders
    for folder in root.getFolders():
        # If the folder size is under 100000 we add it to the sum
        if folder.getTotalSize() < 100000:
            sum += folder.getTotalSize()
        # We add the sum of the children folders
        sum += getSumOfSmallFolders(folder)

    return sum

__all__ = ["getSumOfSmallFolders"]