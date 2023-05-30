mylist = (1, 3, 5, 10, 20)

for i in range(len(mylist)):
    number = mylist[i]
    next_number = mylist[(i + 1) % len(mylist)]
    result = number + next_number
    print("The result of adding", number, "and", next_number, "is", result)