FROM ubuntu:20.04

ADD https://www.nist.gov/document/2018-04-16frameworkv11core1xlsx /opt/cyberframework/nist-csf.xlsx 

COPY parser.py /opt/cyberframework/parser.py

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install openpyxl rtyaml

WORKDIR /opt/cyberframework

CMD python3 parser.py
