# Import the JSON and CSV packages
import json
import csv

# Load in the conflict JSON data
with open('conflict.json') as file:
    data = json.load(file)
country = list() 
# Open the output CSV file we want to write to
with open('data.csv', 'w', newline='') as file:
	csvwriter = csv.writer(file, delimiter=',', quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
    
	csvwriter.writerow(['relid', 'country', 'year', 'type_of_violence', 'side_a', 'side_b', 'deaths_a', 'deaths_b', 'deaths_civilians', 'best_est.'])
	for line in data:
		if line['country'] == 'United Kingdom' or  line['country'] == 'Spain':
			csvwriter.writerow([line['relid'], line['country'], line['year'], line['type_of_violence'], line['side_a'], line['side_b'], line['deaths_a'], line['deaths_b'], line['deaths_civilians'], line['best']]) 
	# Actually write the data to the CSV file here.
    # You can use the same csvwriter.writerow command to output the data 
    #   as is used above to output the headers