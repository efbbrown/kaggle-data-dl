from bs4 import BeautifulSoup
import urllib
import json
r = urllib.urlopen("https://www.kaggle.com/competitions").read()
soup = BeautifulSoup(r)
featured_comps = soup.find("ul", id="featured")
comps = featured_comps.find_all("div", class_="front-comp-details")
comp_table = []
comp_list = []
new_comps = []
for comp in comps:
	# c_obj = {}
	# c_obj["c_name"] = comp.find("a", class_="comp-link").get_text()
	# c_obj["c_link"] = comp.find("a", class_="comp-link")["href"]
	# comp_table.append(c_obj)
	comp_link = comp.find("a", class_="comp-link")["href"][3:]
	comp_list.append(comp_link)
	if comp_link not in open("current_comps.txt").read():
		new_comps.append(comp_link)
		with open("new_comps.txt", "a") as new_file:
			new_file.write(comp_link + "\n")
	else:
		print "Old comp: " + comp_link + "\n"

	# with open("current_comps.txt", "a") as comp_file:
		# comp_file.write(comp_link + "\n")
# print comp_list
# with open("current_comps.json", "r") as comp_file:
# 	old_comps = json.load(comp_file)
	
# with open("current_comps.json", "w") as comp_file:
	#comp_file.write(str(comp_table))
	# json.dump(comp_table, comp_file)
