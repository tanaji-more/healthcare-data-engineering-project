import requests
import json
from datetime import datetime

#Healthcare FHIR API endpoint
API_URL = "https://hapi.fhir.org/baseR4/Patient"
total_records = 2000     # thsi much data i want
page_size = 100          # per API call (FHIR standard page size)

all_patients = []
next_url = f"{API_URL}?_count={page_size}"

while next_url and len(all_patients) < total_records:
    print(f"Fetching : {next_url}")
    response = requests.get(next_url)

    if response.status_code != 200:
        print("API failed:", response.status_code)
        break
    data = response.json()


    #collect patient entries

    entries = data.get('entry', [])
    all_patients.extend(entries)

    #find next page link

    next_url = None
    for link in data.get('link', []):
        if link["relation"] == "next":
            next_url = link["url"]
            break
    
    print(f"Total patients fetched: {len(all_patients)}")

#trim to exactly 2000 records

all_patients = all_patients[:total_records]

#save data to json file

timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
filename = f"api_data/patients_{total_records}_{timestamp}.json"

with open (filename, "w") as f: 
    json.dump(all_patients, f, indent=4)
    
print(f"\n {len(all_patients)} patient records saved to {filename}")

