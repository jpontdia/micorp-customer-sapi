%dw 2.0
/**
* Generates a string parameter for the WHEN clause in SOQL
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `field` | String | Name of the field parameter
* | `value` | String | Value
* |===
*
* === Example
*
* stringParameter("firstName__c", "Joe")
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
* var firstName = "Joaquin"
* ---
* 
* stringParameter("firstName__c", firstName))
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* firstName__c ='Joaquin'
* ----
*
*/
fun stringParameter(field, value) =
    if (value != null) field ++ " ='" ++ value ++ "'" else null

fun soqlBuilder(sqlFilter, connector, parameter) =
  if (parameter != null)
    (
        if (sqlFilter == "") " WHERE " ++ parameter
        else sqlFilter ++ " " ++ connector ++ " " ++ parameter
    )
  else
    sqlFilter