%dw 2.0
import * from dw::System
output application/json
---
{
    protocol:   envVar('micorpcustomersapi_protocol') default "Undefined",
    host:       envVar('micorpcustomersapi_host') default "Undefined",
    port:       envVar('micorpcustomersapi_port') default "Undefined",
    basepath:   envVar('micorpcustomersapi_basepath') default "Undefined"
}