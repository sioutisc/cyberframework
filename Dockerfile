FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && pip3 install openpyxl rtyaml

ADD https://www.nist.gov/document/framework-improving-critical-infrastructure-cybersecurity-corexlsx /opt/cyberframework/nist-csf.xlsx 

# Parser seems broken for v1.1 of xlsx file
#ADD https://www.nist.gov/document/2018-04-16frameworkv11core1xlsx /opt/cyberframework/nist-csf.xlsx 

COPY parser.py /opt/cyberframework/parser.py

WORKDIR /opt/cyberframework

CMD python3 parser.py
