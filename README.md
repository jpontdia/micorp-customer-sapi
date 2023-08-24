# Salesforce Customer SAPI
![Powered by](https://img.shields.io/badge/Powered%20by-Mulesoft-blue.svg)
  ![Unit test](https://gist.githubusercontent.com/jpontdia/ef8cdef1ff940eac4d8716f6361d2363/raw/micorp-customer-sapi-ut.svg)
  ![Code coverage](https://gist.githubusercontent.com/jpontdia/ef8cdef1ff940eac4d8716f6361d2363/raw/micorp-customer-sapi-cc.svg)
  ![Build and deploy](https://github.com/jpontdia/micorp-customer-sapi/actions/workflows/build.yml/badge.svg)
<br>

Mulesoft service for creating customers in Salesforce using data from the Corporate Orders System.

  > This project follows the standards defined in the Development Process Document in Anypoint Exchange
  
## Table of contents
1. [Description](#description)
1. [Configuration](#configuration)

## Description  
Mulesoft service for creating customers in Salesforce using data from the Corporate Orders System. The next diagram shows the architecture of the service:

![architecture](https://github.com/jpontdia/micorp-customer-sapi/raw/main/docs/architecture.png)

<br>
 
## Configuration

The next properties must be provided to run the service:

| Property                  | Description               |
| ------------------------- | ------------------------- |
| salesforce.keystore       | Keystore with cetificates to connect with Salesforce. Salesforce JWT Authentication |
| salesforce.consumerkey    | Salesforce Consumer Key   |
| salesforce.principal      | Salesforce User           |
| salesforce.storepassword  | Password for the keystore |
| api.id                    | API Manager instance id |
| http.port                 | Listening port for the service |

<br>

---

- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [Mulesoft Documentation](https://docs.mulesoft.com/general/)