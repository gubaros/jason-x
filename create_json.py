import json

def generate_large_json_file(filename, size_in_mb=2):
    # Each entry is approximately 100 bytes, adjust as needed
    bytes_per_entry = 100
    number_of_entries = (size_in_mb * 1024 * 1024) // bytes_per_entry

    data = [
        {
            "id": i,
            "name": f"Name_{i}",
            "email": f"user_{i}@example.com",
            "data": "This is some sample data to increase the size of each JSON object."
        }
        for i in range(number_of_entries)
    ]

    with open(filename, 'w') as f:
        json.dump(data, f)

generate_large_json_file('example.json')

