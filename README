## Overview

How to install:

- With  docker
- Without docker

How to use:

With, for example, the Ultrasound Nerve Segmentation competition:

1. Go to the main page of the competition whose data you want to download and note the text following www.kaggle.com/c/ as this will be the argument we supply to the download function.

URL: www.kaggle.com/c/ultrasound-nerve-segmentation
Name: ultrasound-nerve-segmentation

<img src="tmp/comp-home.JPG" alt="Smiley face"></img>

2. Create a new directory for your project and change into it. I usually use the name of the competition:

`COMP=ultrasound-nerve-segmentation`
`mkdir $COMP`
`cd $COMP`

3. You need to save your cookies.txt file from www.kaggle.com. This [chrome extension](https://chrome.google.com/webstore/detail/cookietxt-export/lopabhfecdfhgogdbojmaicoicjekelh) is a handy tool in collecting your cookies.txt file. Install the extension, go to the [Kaggle homepage](https://www.kaggle.com/), fire the extension by clicking the icon in the toolbar, and save the text to a file cookies.txt in your present working directory.

4. Run the docker repository with:

`docker run -v $(pwd):/tmp/ efbbrown/kaggle-data-dl:0.2.4 ./app.sh $COMP`

This call runs the image with arguments:
 - `-v $(pwd):/tmp/` - With a volume between the present host directory and the /tmp/ folder of the image. This means the cookies.txt file is shared with the image and the competition data files the image downloads will be shared with the host computer.
 - `./app.sh $COMP` - Runs the app.sh script that scrapes the file names from the competition page and then `wget`s the data files and places them in the shared volume.

The data should be in your data folder now.

In future, just copy the cookies.txt file you grabbed in step 3 to the project directory of the next kaggle competition you want to enter, make a data directory and rerun the docker run command.
