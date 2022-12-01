FROM mcr.microsoft.com/azure-functions/python:4-python3.9

RUN apt-get update

RUN apt-get install -y build-essential python3-venv python3-pip libpango-1.0-0 libpangoft2-1.0-0

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /home/site/wwwroot
