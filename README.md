# Salesforce Customer SAPI
![Build and deploy](https://github.com/jpontdia/mule-micorp-customer-sapi/actions/workflows/dev.yml/badge.svg)

Personal Mulesoft demo service for the MICORP domain

## Table of contents
1. [Description](#description)
2. [Resources](#resources) 
3. [Prerequisites](#prerequisites)
4. [Build and packaging](#build-and-packaging)
5. [Exchange deployment](#exchange-deployment)
6. [Additional runtime properties](#additional-runtime-properties)
7. [Anypoint Studio development](#anypoint-studio-development)

## Description
Mulesoft service for creating customers in Salesforce using data from the Corporate Orders System. The next diagram shows the architecture of the service:

![architecture](https://github.com/jpontdia/mule-micorp-customer-sapi/raw/main/docs/architecture.png)

<br>

## Resources
The resources associated with the service are:

 - API specification at [Anypoint Exchange](https://anypoint.mulesoft.com/exchange/078efef1-d139-48ed-92f5-f8d4a0592374/micorp-customer-sapi/) (must provide auth credentials)
 - Micorp Developer Portal
 - Source code [Github](https://github.com/jpontdia/mule-micorp-customer-sapi)

<br>

## Prerequisites
To compile and build the project:

 - Java Development Kit (JDK) 8. Must be version 8!
 - Apache Maven, version 3.8 or later.
 - A settings.xml with proper configuration to access:
   - The Anypoint organization maven repository
   - The Mulesoft EE repositories (to run the test cases)
 - Optional: Anypoint Studio.

Deployment in Anypoint Exchange:

 - A connected app for maven deployment

<br>

## Build and packaging

The settings maven file for thiis service is located at: [settings.xml](https://github.com/jpontdia/mule-micorp-pom/blob/main/settings.xml). The credentials for the Maven Nexus EE repository must be provided as well as the connected app for deployment in the Anypoint organization.

The sensitive data was removed from the configuration files. The next properties must be provided to compile, test and package the service:

| Property    | Description |
| ----------- | ----------- |
| salesfoce.user      | Salesforce User       |
| salesforce.password | Salesforce Password |
| salesforce.token    | Salesforce Access Token |
| encrypt.key         | Encryption Key for the secured service properties |


Mac example:

```bash
export encrypt_key=ThisIsAdemokey23434$
export salesforce_user=myuser@mycompany.com
export salesforce_password=MyPassword
export salesforce_token=sdfjk3432hsdgskgjsg

mvn clean package \
-Dencrypt.key=$encrypt_key \
-Dsalesforce.user=$salesforce_user \
-Dsalesforce.password=$salesforce_password \
-Dsalesforce.token=$salesforce_token \
-Dcommit.hash=-bc0be6e \
-Dbuild.id=-00
```

<br>

## Exchange deployment

The next properties must be provided at the command line or the CICD pipeline:

| Property    | Description |
| ----------- | ----------- |
| anypoint.environment.clientid | Anypoint environment client credentials for the runtime. Client-id |
| anypoint.environment.secret   | Anypoint environment client credentials for the runtime. Secret for the Client-id |
| cicd.connectedapp.clientid | Connected App for deployment in CICD. Client-id |
| cicd.connectedapp.secret   | Connected App for deployment in CICD. Secret for the Client-id |
| deployment.prefix | Prefix added to the name of the service |
| deployment.env | Deployment environment, by default is dev |
| commit.hash    | Git commit hash appended to the name of the jar file |
| build.id       | Build number appended to the name of the jar fiie |

Mac example:

```bash
export anypoint_environment_clientid=123423434fd40841a6a47bdcadfsdf
export anypoint_environment_secret=F77CfFEA3a9741A19B211111111111
export cicd_connectedapp_clientid=0150ba7ce5ef41cdaf0151158789c64a
export cicd_connectedapp_secret=ac6590a218B34A1799cC8798d2E004f8

# clean, compile, test and package the jar file
mvn deploy -DmuleDeploy \
-Dencrypt.key=$encrypt_key \
-Dsalesforce.user=$salesforce_user \
-Dsalesforce.password=$salesforce_password \
-Dsalesforce.token=$salesforce_token \
-Danypoint.environment.clientid=$anypoint_environment_clientid \
-Danypoint.environment.secret=$anypoint_environment_secret \
-Dcicd.connectedapp.clientid=$cicd_connectedapp_clientid \
-Dcicd.connectedapp.secret=$cicd_connectedapp_secret \
-Ddeployment.prefix= \
-Ddeployment.env=dev \
-Dcommit.hash=-bc0be6e \
-Dbuild.id=-00
```

<br>

## Additional runtime properties

The table below shows the additional properties that can be customized in the service:

| Property  | Description |
| --------- | ----------- |
| api.id    | API Manager instance id |
| http.port | Listening port for the service |

<br>

## Anypoint Studio development

The next list of properties must be provided in Anypoint Studio in order to run the service:

 - anypoint.environment.clientid
 - anypoint.environment.secret 
 - encrypt.key
 - mule.env - Same as deployment.env, which is described in [Exchange deployment](#exchange-deployment)
 - salesfoce.user
 - salesforce.password
 - salesforce.token  

<br>

---
[Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

[Mulesoft Documentation](https://docs.mulesoft.com/general/)