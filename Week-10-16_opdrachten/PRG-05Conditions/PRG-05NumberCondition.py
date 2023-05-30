while True:
    number = int(input("Enter a number: "))

    if number > 100:
        print("The number is higher than 100.")
    elif number < 100:
        print("The number is lower than 100.")
    else:
        print("Congratulations! You entered 100.")
        break
