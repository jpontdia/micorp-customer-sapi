import * from bat::BDD
import * from bat::Assertions
import * from bat::Mutable

var context = bat::Mutable::HashMap()
var firstName = "Maria-1009"
var lastName = "Bonita-1009"
var url = "$(config.protocol)://$(config.host):$(config.port)$(config.basepath)/customers"
---
describe("The CRUD process for micorp-customer-sapi") in [

  it("Create a new customer") in [
    POST `$(url)` with {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: {
        "firstName": "$(firstName)",
        "lastName": "$(lastName)",
        "address": "1234 Main St San Jose 12345"
      }
    }  assert [
      $.response.status mustEqual 201
    ] execute [
      log($.response),
      context.set('customerId', ($.response.headers.Location splitBy  "/")[3] )
    ]
  ],

  it must 'Get the customer created by id' in [
    GET `$(url)/$(context.get('customerId'))` with {

    } assert [
      $.response.status mustEqual 200,
      context.get('customerId') mustEqual $.response.body.customerId,
    ] execute [
      log($.response)
    ]
  ],

  it must 'Get the customer created by name' in [
    GET `$(url)?firstName=$(firstName)&lastName=$(lastName)` with {

    } assert [
      $.response.status mustEqual 200,
      context.get('customerId') mustEqual $.response.body[0].customerId,
    ] execute [
      log($.response)
    ]
  ],

  it must 'Delete the customer' in [
    DELETE `$(url)/$(context.get('customerId'))` with {

    } assert [
      $.response.status mustEqual 200
    ] execute [
      log($.response)
    ]
  ]
  
]