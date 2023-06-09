# Salesforce Customer SAPI
![Powered by](https://img.shields.io/badge/Powered%20by-Mulesoft-blue.svg)
&nbsp;&nbsp;
![Unit test](https://gist.githubusercontent.com/jpontdia/ef8cdef1ff940eac4d8716f6361d2363/raw/micorp-customer-sapi-ut.svg)
&nbsp;&nbsp;
![Code coverage](https://gist.githubusercontent.com/jpontdia/ef8cdef1ff940eac4d8716f6361d2363/raw/micorp-customer-sapi-cc.svg)
<br> 
![Build and deploy](https://github.com/jpontdia/mule-micorp-customer-sapi/actions/workflows/build.yml/badge.svg)
&nbsp;&nbsp;
![dev](https://badgen.net/github/checks/jpontdia/mule-micorp-customer-sapi/main/dev?label=Deployment%20dev)
&nbsp;&nbsp;
![tst](https://badgen.net/github/checks/jpontdia/mule-micorp-customer-sapi/main/tst?label=Deployment%20tst)
<br>
Mulesoft service for creating customers in Salesforce using data from the Corporate Orders System
  
## Table of contents
1. [Description](#description)
1. [Prerequisites](#prerequisites) 
1. [Build and packaging](#build-and-packaging)
1. [Exchange deployment](#exchange-deployment)
1. [Additional runtime properties](#additional-runtime-properties)

## Description  
Mulesoft service for creating customers in Salesforce using data from the Corporate Orders System. The next diagram shows the architecture of the service:

![architecture](https://github.com/jpontdia/mule-micorp-customer-sapi/raw/main/docs/architecture.png)

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

Configure the maven settings file with:
 - The credentials for the Maven Nexus EE repository
 - Connected app for deployment in the Anypoint organization.

The sensitive data was removed from the configuration files. The next properties must be provided to compile, test and package the service:

| Property    | Description |
| ----------- | ----------- |
| salesforce.keystore | Keystore with cetificates to connect with Salesforce. Salesforce JWT Authentication |
| salesforce.consumerkey | Salesforce Consumer Key |
| salesforce.principal    | Salesforce User |
| salesforce.storepassword  | Password for the keystore |

Mac example:

```bash
#Properties for salesforce
export salesforce_storepassword=mykeystorepassword
export salesforce_principal=user@fakegmail.com
export salesforce_consumerkey=4M3439gP.VbJma8Wlu2C246aMscxqWewrwerf16qBTqgJ_W_83zcxkOHabPMNVQ7Zp9w9erow6j2.ANtwFErfsdfdsfd
export salesforce_keystore=mykeystore.jks

mvn clean package \
-Dsalesforce.storepassword=$salesforce_storepassword \
-Dsalesforce.principal=$salesforce_principal \
-Dsalesforce.consumerkey=$salesforce_consumerkey \
-Dsalesforce.keystore=$salesforce_keystore
```

<br>

## Exchange deployment
maven command to deploy asset in anypoint exchange:


```bash 
mvn deploy
```

## Additional runtime properties

The table below shows the additional properties that can be customized in the service:

| Property  | Description |
| --------- | ----------- |
| api.id    | API Manager instance id |
| http.port | Listening port for the service |

<br>

---
- [Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [Mulesoft documentation](https://docs.mulesoft.com/general/)
- [Git log standard](https://github.com/ahmadawais/Emoji-Log)
- [Github badges](https://badgen.net/github)