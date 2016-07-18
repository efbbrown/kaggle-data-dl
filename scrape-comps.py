from bs4 import BeautifulSoup
import urllib
import json
r = urllib.urlopen("https://www.kaggle.com/competitions").read()
soup = BeautifulSoup(r)
featured_comps = soup.find("ul", id="featured")
comps = featured_comps.find_all("div", class_="front-comp-details")
comp_table = []
for comp in comps:
	c_obj = {}
	c_obj["c_name"] = comp.find("a", class_="comp-link").get_text()
	c_obj["c_link"] = comp.find("a", class_="comp-link")["href"]
	comp_table.append(c_obj)
# with open("current_comps.json", "w") as comp_file:
	#comp_file.write(str(comp_table))
	# json.dump(comp_table, comp_file)
