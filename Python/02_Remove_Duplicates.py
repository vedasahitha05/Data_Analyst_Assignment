# Take input string from the user
s = input("Enter string: ")
# Initialize an empty string to store unique characters
result = ""
# Loop through each character in the input string
for ch in s:
    # If the character is not already in result, add it
    if ch not in result:
        result += ch
# Print the string containing only unique characters
print("Unique string:", result)
