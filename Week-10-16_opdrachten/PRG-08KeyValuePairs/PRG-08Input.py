import csv

# Prompt the user for their information
first_name = input("Enter your first name: ")
last_name = input("Enter your last name: ")
job_title = input("Enter your job title: ")
company = input("Enter your company name: ")

# Create a dictionary to store the information
person = {
    "First name": first_name,
    "Last name": last_name,
    "Job title": job_title,
    "Company": company
}

# Write the information to a CSV file
with open("user_info.csv", "a", newline="") as file:
    writer = csv.DictWriter(file, fieldnames=person.keys())
    
    # Check if the file is empty
    if file.tell() == 0:
        writer.writeheader()
    
    writer.writerow(person)

print("User information has been written to user_info.csv.")
