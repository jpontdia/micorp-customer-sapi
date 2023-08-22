%dw 2.0
import * from dw::System
output application/json
---
{
    url: "http://micorp-customer-sapi-dev.us-w1.cloudhub.io/api/customers",
    principal:  envVar('salesforce_principal') default "Undefined",
    protocol:   envVar('micorpcustomersapi_dev_protocol') default "Undefined",
    host:       envVar('micorpcustomersapi_dev_host') default "Undefined",
    port:       envVar('micorpcustomersapi_dev_port') default "Undefined",
    basepath:    envVar('micorpcustomersapi_dev_basepath') default "Undefined"
}