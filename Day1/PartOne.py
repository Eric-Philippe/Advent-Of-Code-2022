"""
This function is used to read the data from the input file
"""
def read_data():
    with open("input.txt", "r") as f:
        data = f.read()
    return data
"""
Convert what you read from the file into a list of numbers and returns the maximum number
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
    return max(Inventory)
"""
Main Runner
"""
def run(debug = True):
    data = read_data()
    result = convert_data(data)
    if debug : print(result)