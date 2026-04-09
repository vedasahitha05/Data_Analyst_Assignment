# Get the total minutes input from the user
minutes = int(input("Enter minutes: "))
# Calculate the number of full hours
hours = minutes // 60
# Calculate the remaining minutes after converting to hours
remaining_minutes = minutes % 60
# Check if there is at least 1 hour
if hours > 0:
    # If exactly 1 hour, use singular "hr"
    if hours == 1:
        print(f"{hours} hr {remaining_minutes} minutes")
    # If more than 1 hour, use plural "hrs"
    else:
        print(f"{hours} hrs {remaining_minutes} minutes")
# If less than 1 hour, only display minutes
else:
    print(f"{remaining_minutes} minutes")
