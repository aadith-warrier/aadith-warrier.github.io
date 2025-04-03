import yaml 
import json
import bibtexparser

bibtex_path = "_bibliography/papers.bib"
yaml_path = 'aadith_warrier_cv/aadith_warrier_CV.yaml'
json_path = 'assets/json/resume.json'

months_to_numbers = {
    "jan": "01",
    "feb": "02",
    "mar": "03",
    "apr": "04",
    "may": "05",
    "jun": "06",
    "jul": "07",
    "aug": "08",
    "sep": "09",
    "oct": "10",
    "nov": "11",
    "dec": "12"
}

def clean_string(title):
    title = list(title)
    out = ""
    for i in title:
        if i != '{' and i != '}':
            out = out + i
    return out

def convert_names_to_list(names_string):
    # Split the names string by ' and ' to get individual names
    names = names_string.split(' and ')
    
    # Initialize an empty list to store the result
    result = []
    
    # Iterate through each name
    for name in names:
        # Split the name by comma and strip any extra whitespace
        last_name, first_name = [part.strip() for part in name.split(',')]
        
        # Abbreviate the first name
        abbreviated_first_name = first_name[0] + '.'
        
        # Combine the abbreviated first name and the last name
        abbreviated_name = f"{abbreviated_first_name} {last_name}"

        #Highlight your name
        if abbreviated_name == "A. Warrier":
            abbreviated_name = '***A. Warrier***'
        
        # Append the formatted name to the result list
        result.append(abbreviated_name)
    
    return result


with open(yaml_path, 'r') as f:
    yaml_data = yaml.load(f, Loader=yaml.SafeLoader)

cv_data = yaml_data['cv']
json_data = {}

name = cv_data['name']

contact = {"email":cv_data['email'], "github":"www.github.com/"+cv_data['social_networks'][0]['username']}

education = []
for i in cv_data["sections"]['education']:
    edu = { "institution":i["institution"],
            "location":i['location'],
            "studyType":i['degree'],
            "startDate":i['start_date'],
            "endDate":i['end_date']
    }
    education.append(edu)

researchex = []
for i in cv_data['sections']['research experience']:
    ex = {  "name":i["company"],
            "position":i["position"],
            "location":i["location"],
            "startDate":i['start_date'],
            "endDate":i["end_date"],
            "summary":"",
            "highlights": i['highlights']
    }
    researchex.append(ex)

with open(bibtex_path, 'r') as f:
    bibtex_data = bibtexparser.parse_string(f.read())

publications_json = []
publications_yaml = []
for i in bibtex_data.entries:
    title = clean_string(i.fields_dict["title"].value)
    authors = convert_names_to_list(i.fields_dict['author'].value)
    publisher = clean_string(i.fields_dict['booktitle'].value)
    releaseDate = i.fields_dict['year'].value + "-" +months_to_numbers[i.fields_dict['month'].value]
    doi = i.fields_dict['doi'].value

    pub = {
            "name": title,
            "publisher": publisher,
            "releaseDate": releaseDate,
            "summary": "",
            "url": doi
    }

    publications_json.append(pub)

    pub = {
            "title": title,
            "authors": authors,
            "doi": doi,
            "date": releaseDate
    }

    publications_yaml.append(pub)

cv_data['sections']['publications'] = publications_yaml

projects = []
for i in cv_data['sections']['projects']:
    proj = {"name": i['name'],
            "summary": "",
            "highlights": i['highlights'],
            "url": ""
    }
    projects.append(proj)

skills = []
for i in cv_data['sections']['skills']:
    skill = {   "name": i['label'],
                "keywords": i['details']
    }
    skills.append(skill)

json_data = {
            "name": name,
            "contact": contact,
            "education": education,
            "work": researchex,
            "publications": publications_json,
            "projects": projects,
            "skills": skills
}

with open(json_path, mode="w", encoding="utf-8") as write_file:
    json.dump(json_data, write_file, indent=4)

with open(yaml_path, 'w') as f:
    cv_data_out = { 
        "email":cv_data['email'],
        "location":cv_data['location'],
        "name":cv_data['name'],
        "phone":cv_data['phone'],
        "sections":{
            "education":cv_data['sections']['education'],
            "research experience":cv_data['sections']['research experience'],
            "publications": publications_yaml,
            "projects":cv_data['sections']['projects'],
            "skills":cv_data['sections']['skills']
        },
        "social_networks": cv_data['social_networks']
    }
    yaml_data['cv'] = cv_data_out
    yaml.dump(yaml_data, f, default_flow_style=False, sort_keys=False)
