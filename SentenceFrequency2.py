import collections
import sys

def analyze_text(input_file, output_file):
    # Read the input text file
    with open(input_file, 'r', encoding='utf-8') as file:
        text = file.read()

    # Extract the input file name
    file_name = input_file.split('/')[-1]

    # Count the frequency of each letter
    letter_count = collections.Counter(text)

    # Sort letters by frequency
    sorted_letters = sorted(letter_count.items(), key=lambda x: x[1], reverse=True)

    # Separate lowercase and capital letters
    lowercase_letters = []
    capital_letters = []
    for letter, count in sorted_letters:
        if letter.isalpha():
            if letter.islower():
                lowercase_letters.append(f"{letter}: {count}")
            else:
                capital_letters.append(f"{letter}: {count}")

    # Create the output file with the specified name
    with open(output_file, 'w', encoding='utf-8') as file:
        # Write the analyzed text to the output file
        file.write(file_name + '\n\n')
        file.write(text + '\n\n')

        # Write the letters by frequency to the output file
        file.write("Lowercase Letters:\n")
        file.write('\n'.join(lowercase_letters) + '\n\n')
        file.write("Capital Letters:\n")
        file.write('\n'.join(capital_letters) + '\n\n')

        # Write word and character count to the output file
        words = text.split()
        word_count = len(words)
        character_count = len(text)

        file.write(f"Word count: {word_count}\n")
        file.write(f"Character count: {character_count}\n")


# Usage example
if len(sys.argv) < 3:
    print("Usage: python script.py <input_file_path> <output_file_path>")
else:
    input_file_path = sys.argv[1]
    output_file_path = sys.argv[2]
    analyze_text(input_file_path, output_file_path)