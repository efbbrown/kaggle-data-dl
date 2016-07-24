FROM ubuntu:latest
MAINTAINER Eugene Brown "efbbrown@gmail.com"

RUN apt-get update && apt-get install -y \
	python-pip python-dev build-essential \
	wget git ca-certificates

COPY . /app

RUN git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

WORKDIR /app

RUN pip install -r requirements.txt
RUN pip install python-dateutil

WORKDIR /opt

ADD ./s3cfg /opt/.s3cfg
ADD ./main.sh /opt/main.sh

# Main entrypoint script
RUN chmod 777 /opt/main.sh

# Folders for s3cmd optionations
RUN mkdir /opt/src
RUN mkdir /opt/dest

# WORKDIR /
# RUN /opt/main.sh
# CMD ["/opt/main.sh"]

WORKDIR /app

ENTRYPOINT ["bash"]
CMD ["app.sh"]