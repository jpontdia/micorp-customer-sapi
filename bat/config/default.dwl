%dw 2.0
import * from dw::System
output application/json
---
{
    protocol:   envVar('micorpcustomersapi_dev_protocol') default "Undefined",
    host:       envVar('micorpcustomersapi_dev_host') default "Undefined",
    port:       envVar('micorpcustomersapi_dev_port') default "Undefined",
    basepath:   envVar('micorpcustomersapi_dev_basepath') default "Undefined"
}