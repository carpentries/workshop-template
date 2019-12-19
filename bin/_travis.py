import yaml
import datetime
# We need to split the incoming file
with open("index.md", 'r') as reader:
	# There are multiple yaml documents in the index.md	

	blankbit, yaml_to_load, text = reader.read().split("---")

yaml_data = yaml.load(yaml_to_load, Loader=yaml.Loader) # To deal with depreciation warnings, we need Loader=Loader


yaml_data['venue']="Foo" 
yaml_data['address']="Room 123" 
yaml_data['country']="us" 
yaml_data['language']="en" 
yaml_data['latitude']="0"
yaml_data['longitude']="0"
yaml_data['humandate']="Jan 01-02, 2020" 
yaml_data['humantime']="9:00 am - 4:30 pm" 
yaml_data['startdate']= datetime.datetime.today()
yaml_data['enddate']= datetime.datetime.today()
yaml_data['instructor']=["Foo"]
yaml_data['helper']=["Foo"] 
yaml_data['email']=["foo@bar.com"]
yaml_data['collaborative_notes'] =  "http://foo.bar"
yaml_data['eventbrite']="1234567890AB" 

with open("index.md", "w") as writer:
	writer.write("---\n") #blankbit is technically a yaml document
	yaml.dump(yaml_data, writer)
	writer.write("---\n")
	writer.write(text)
