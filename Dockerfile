FROM ubuntu:latest
MAINTAINER Eugene Brown "efbbrown@gmail.com"

RUN apt-get update && apt-get install -y \
	python-pip python-dev build-essential \
	wget git ca-certificates

COPY app /app

WORKDIR /app

RUN pip install -r requirements.txt
RUN pip install python-dateutil

RUN chmod 500 ./app.sh ./dl-data.sh

ENTRYPOINT ["bash"]
CMD ["app.sh"]
