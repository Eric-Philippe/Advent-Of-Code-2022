from Utils import getData, buildRepositoryTree
from PartOne import getSumOfSmallFolders
from PartTwo import getSmallerFolderToDelete

if __name__ == '__main__':
    data = getData()
    root = buildRepositoryTree(data)
    #print(getSumOfSmallFolders(root))
    print(getSmallerFolderToDelete(root))
