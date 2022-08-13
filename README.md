# mule-micorp-customer-sapi
![Build and deploy](https://github.com/jpontdia/mule-micorp-customer-sapi/actions/workflows/dev.yml/badge.svg)

>Mulesoft Demo System API - Micorp Salesforce Customer Repository

## Table of contents
1. [Architecture](#architecture) 
2. [Prerequisites](#prerequisites)
3. [Build and packaging](#build-and-packaging)

<br>

## Architecture

Service for creating Customers in Salesforce using data from the Corporate Orders System. Next the architecture diagram:

![architecture](https://github.com/jpontdia/mule-micorp-customer-sapi/raw/main/docs/architecture.png)

<br>
API specification: ![Anypoint Exchange](https://anypoint.mulesoft.com/exchange/078efef1-d139-48ed-92f5-f8d4a0592374/micorp-customer-sapi/)

## Prerequisites
To compile and build the project:
* Java Development Kit (JDK) 8. Must be version 8!
* Apache Maven, version 3.8 or later.
* A settings.xml with proper configuration to access the Anypoint organization and Mulesoft EE repositories 
* Optional: Anypoint Studio.

Deployment in Anypoint Exchange:
* A connected app for maven deployment

<br>

## Build and packaging

The settings.xml file used for this service is here: https://github.com/jpontdia/mule-micorp-pom/blob/main/settings.xml

The sensitive data was removed from the configuration files. The next
properties must be provided to run the service:

| Property    | Description |
| ----------- | ----------- |
| salesfoce.user      | Salesforce User       |
| salesforce.password | Salesforce Password |
| salesforce.token    | Salesforce Access Token |
| encrypt.key         | Encryption key for secure properties       |
| anypoint.environment.clientid | Anypoint environment client credentials for the runtime, Client-id |
| anypoint.environment.secret   | Anypoint environment client credentials for the runtime, Secret |


on mac example:
```bash
export encrypt_key=ThisIsAdemokey23434$
export anypoint_environment_clientid=123423434fd40841a6a47bdcadfsdf
export anypoint_environment_secret=F77CfFEA3a9741A19B211111111111
export salesforce_user=myuser@mycompany.com
export salesforce_password=MyPassword
export salesforce_token=sdfjk3432hsdgskgjsg

# clean, compile, test and package the jar file
mvn clean package \
-Dencrypt.key=$encrypt_key \
-Dsalesforce.user=$salesforce_user \
-Dsalesforce.password=$salesforce_password \
-Dsalesforce.token=$salesforce_token \
-Dcommit.hash=-bc0be6e \
-Dbuild.id=-00
```

---
[Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)