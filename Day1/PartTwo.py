"""
Read the data from the file
"""
def read_data():
    with open("input.txt", "r") as f:
        data = f.read()
    return data
"""
Convert the data read to a list of sum separated by blank lines and returns the three largest numbers
"""
def convert_data(data):
    Inventory = []
    total = 0
    for line in data.splitlines():
        if line == "":
            Inventory.append(total)
            total = 0
        else:
            total += int(line)
    Inventory.append(total)
    Inventory.sort()
    return Inventory[-1] + Inventory[-2] + Inventory[-3]
"""
Main Runner
"""
def run(debug = True):
    data = read_data()
    result = convert_data(data)
    if debug : print(result)