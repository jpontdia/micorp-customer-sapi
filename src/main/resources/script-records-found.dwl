%dw 2.0
output application/json
---
if ( payload != null)
    "Records found: " ++ sizeOf(payload)
else "No records"