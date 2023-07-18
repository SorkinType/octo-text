import os
import sys
import re
from collections import Counter

def reorder_sentences(input_file, output_file):
    # Read the input file
    with open(input_file, 'r', encoding='utf-8') as file:
        text = file.read()

    # Split the text into sentences using a simple regex pattern
    sentences = re.split(r'(?<=[.!?])\s+', text)

    # Count the frequency of each sentence
    sentence_count = Counter(sentences)

    # Sort the sentences by frequency (highest to lowest)
    sorted_sentences = sorted(sentence_count.items(), key=lambda x: x[1], reverse=True)

    # Reorder the sentences based on frequency
    reordered_text = '\n'.join([sentence for sentence, _ in sorted_sentences])

    # Write the reordered text to the output file
    with open(output_file, 'w', encoding='utf-8') as file:
        file.write(reordered_text)

# Parse command-line arguments
if len(sys.argv) < 3:
    print('Usage: python script.py <input_file> <output_file>')
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

reorder_sentences(input_file, output_file)