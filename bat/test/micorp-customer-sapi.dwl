import * from bat::BDD
import * from bat::Assertions
import * from bat::Mutable

var context = bat::Mutable::HashMap()
var firstName = "Maria-1009"
var lastName = "Bonita-1009"
---
describe("The CRUD process for micorp-customer-sapi") in [

  it("Print env variables") in [
    log("Env variable: $(config.principal)")
  ],

  it("Create a new customer") in [
    POST `$(config.url)` with {
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
    GET `http://micorp-customer-sapi-dev.us-w1.cloudhub.io/api/customers/$(context.get('customerId'))` with {

    } assert [
      $.response.status mustEqual 200,
      context.get('customerId') mustEqual $.response.body.customerId,
    ] execute [
      log($.response)
    ]
  ],

  it must 'Get the customer created by name' in [
    GET `http://micorp-customer-sapi-dev.us-w1.cloudhub.io/api/customers?firstName=$(firstName)&lastName=$(lastName)` with {

    } assert [
      $.response.status mustEqual 200,
      context.get('customerId') mustEqual $.response.body[0].customerId,
    ] execute [
      log($.response)
    ]
  ],

  it must 'Delete the customer' in [
    DELETE `http://micorp-customer-sapi-dev.us-w1.cloudhub.io/api/customers/$(context.get('customerId'))` with {

    } assert [
      $.response.status mustEqual 200
    ] execute [
      log($.response)
    ]
  ]
  
]