number_input = input("Enter a number: ")
number = int(number_input)

if number > 100:
    print(number_input + " is higher then 100!")
elif number < 100:
    print(number_input + " is lower then 100!")
else:
    print("Thats exactly 100!")