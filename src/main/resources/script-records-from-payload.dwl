%dw 2.0
output json

---
payload map (item, value) ->
{
    firstName: item.firstName__c,
    lastName: item.lastName__c,
    address: item.address__c,
    customerId: item.Id
}