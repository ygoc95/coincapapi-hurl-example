GET {{host}}/v2/assets
HTTP 200
[Asserts] 
header "Content-Type" == "application/json; charset=utf-8"
header "date" exists
header "server" =="cloudflare"
duration < 1000  
jsonpath "$.data" isCollection
jsonpath "$.data" count > 20
[Captures]
capturedVariable : jsonpath "$.data[0].id"


GET {{host}}/v2/assets
[QueryStringParams]
search: {{capturedVariable}}
limit: 2
HTTP 200
[Asserts] 
header "Content-Type" == "application/json; charset=utf-8"
header "date" exists
header "server" =="cloudflare"
duration < 1000  
jsonpath "$.data" isCollection
jsonpath "$.data" count == 2