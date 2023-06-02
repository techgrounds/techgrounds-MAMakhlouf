# Keeps the code running in a while loop when the if/elif conditions are met
while True:
    ## Convert the input to an integer with int function
    number = int(input("Enter a number: "))
    # set the conditions
    if number > 100:
        print("The number is higher than 100.")
    elif number < 100:
        print("The number is lower than 100.")
    else:
        print("Congratulations! You entered 100.")
        break
