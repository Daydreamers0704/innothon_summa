import json

# Define your dictionaries
data = {
    'acne': r'.*\s*acne.*pimple.*zits.*blemishes.*breakouts.*skin.*oily.*oil.*face',
    'hairstyle': r'.*hair.*locks.*tresses.*hairstyle.*hairfashion.*hairs',
    'specs': r'.*glasses.*eyeglasses.*lenses.*frames.*optical glasses.*reading glasses.*sunglasses.*goggles.*glass.*eyeglass.*lens'
}

# Specify the file name
file_name = 'data.json'

# Write the dictionary to a JSON file
with open(file_name, 'w') as json_file:
    json.dump(data, json_file, indent=4)

print(f'Data has been written to {file_name}')
