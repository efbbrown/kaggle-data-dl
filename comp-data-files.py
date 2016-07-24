#####################################################
#				Imports 							#
#####################################################

from bs4 import BeautifulSoup
import urllib
import argparse

#####################################################
#				Parse arguments						#
#####################################################

parser = argparse.ArgumentParser(description = "Get data file names for kagglec comp")
parser.add_argument("comp", type = str, help = "The name of a running kaggle competition")
args = parser.parse_args()

print "args.comp : " + str(args.comp) + "\n"


#####################################################
#				Scrape	 							#
#####################################################

comp_url = "https://www.kaggle.com/c/" + args.comp + "/data"
print "Data page url: " + comp_url + "\n"
r = urllib.urlopen(comp_url).read()
soup = BeautifulSoup(r, "html.parser")
comp_data = []
data_files_table = soup.find(lambda tag: tag.name=="table" and tag.has_key("id") and tag["id"]=="data-files")
data_files = data_files_table.find_all("td", class_="file-name")
for file in data_files:
	file_name = file.text + ".zip"
	with open("comp_data_files.txt", "a") as new_file:
		new_file.write(file_name + "\n")